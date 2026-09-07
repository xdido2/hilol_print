import 'package:flutter/material.dart';
import 'package:local_source/local_source.dart';
import '../../domain/repository/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required LocalSource localSource}) : _localSource = localSource;

  final LocalSource _localSource;

  @override
  Locale get locale => _localSource.localization;

  @override
  Future<void> setLocale(Locale locale) => _localSource.setLocalization(locale);

  @override
  ThemeMode get themeMode => _localSource.theme;

  @override
  Future<void> setThemeMode(ThemeMode themeMode) => _localSource.setTheme(themeMode);
}
