import 'dart:io' show Platform;
import 'dart:ui' show Locale;

import 'package:flutter/material.dart' show immutable, ThemeMode;
import 'package:flutter/rendering.dart';
import '../local_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/extensions.dart';
import 'utils/secure_store.dart';

part 'interface/settings_data_source.dart';
part 'interface/session_data_source.dart';
part 'interface/user_data_source.dart';

/// {@template local_source}
/// Local source for the app.
/// {@endtemplate}
@immutable
final class LocalSource extends PreferenceDao
    with SettingsDataSourceMixin, SessionDataSourceMixin, UserDataSourceMixin {
  /// {@macro local_source}
  LocalSource._({required super.sharedPreferences});

  /// The instance of the local source.
  static LocalSource? _instance;

  @override
  final Map<String, Object?> cache = <String, Object?>{};

  /// Static getter for the local source instance.
  static Future<LocalSource> get instance async => _instance ??= await _init();

  /// Initializes the local source.
  static Future<LocalSource> _init() async {
    final shp = await SharedPreferences.getInstance();
    final instance = LocalSource._(sharedPreferences: shp);

    final encryptedEntryKeys = <String>{
      instance._userIdKey.key,
      instance._accessTokenKey.key,
      instance._refreshTokenKey.key,
    };

    final entries = [
      instance._userIdKey,
      instance._accessTokenKey,
      instance._refreshTokenKey,
      instance._hapticsEnabledKey,
      instance._notificationsEnabledKey,
      instance._localizationKey,
      instance._themeKey,
      instance._sessionIdKey,
    ];

    for (final entry in entries) {
      if (encryptedEntryKeys.contains(entry.key)) {
        if (entry is! PreferenceEntry<String>) continue;

        instance.readCachedOrDecrypted(entry);
      } else {
        instance.readFromCache<Object?>(entry);
      }
    }

    return instance;
  }

  @override
  Future<void> clearAll() async {
    // Preserve language and session id when clearing all.
    final currentLocale = localization;
    final currentSessionId = sessionId;

    await super.clearAll();
    cache.clear();

    // Restore preserved values.
    await setLocalization(currentLocale);
    if (currentSessionId.isNotEmpty) {
      await setSessionId(currentSessionId);
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is LocalSource && runtimeType == other.runtimeType);

  @override
  int get hashCode => runtimeType.hashCode;
}
