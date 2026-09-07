part of '../local_source.dart';

/// {@template settings_data_source}
/// Data source for the app settings.
/// {@endtemplate}
abstract interface class SettingsDataSource {
  /// {@macro settings_data_source}
  const SettingsDataSource._();

  Locale get localization;
  Future<void> setLocalization(Locale locale);

  ThemeMode get theme;
  Future<void> setTheme(ThemeMode mode);

  bool get hapticsEnabled;
  Future<void> setHapticsEnabled({required bool enabled});

  bool get notificationsEnabled;
  Future<void> setNotificationsEnabled({required bool enabled});
}

/// {@template settings_data_source_mixin}
/// Mixin for the app settings data source.
/// {@endtemplate}
base mixin SettingsDataSourceMixin on PreferenceDao implements SettingsDataSource {
  /// Entries
  PreferenceEntry<bool> get _hapticsEnabledKey => boolEntry(key: 'settings.haptics_enabled');
  PreferenceEntry<bool> get _notificationsEnabledKey => boolEntry(key: 'settings.notifications_enabled');
  PreferenceEntry<String> get _localizationKey => stringEntry(key: 'settings.localization');
  PreferenceEntry<String> get _themeKey => stringEntry(key: 'settings.theme');

  /// --- Getters --- ///
  @override
  bool get hapticsEnabled => readFromCache<bool>(_hapticsEnabledKey) ?? true;

  @override
  bool get notificationsEnabled => readFromCache<bool>(_notificationsEnabledKey) ?? true;

  @override
  ThemeMode get theme => switch (readFromCache<String>(_themeKey)) {
    'system' => .system,
    'light' => .light,
    'dark' => .dark,
    _ => .light,
  };

  @override
  Locale get localization {
    final locale = readFromCache<String>(_localizationKey);

    final defaultLocale = switch (Platform.localeName.split('-').firstOrNull) {
      'uz' => 'uz',
      _ => 'uz',
    };

    if (locale == null) return Locale(defaultLocale);

    final parts = locale.split('-');

    final languageCode = parts.isNotEmpty ? parts[0] : defaultLocale;
    final scriptCode = parts.length > 1 ? parts[1] : '';
    final normalizedScriptCode = scriptCode == 'null' ? '' : scriptCode;

    return Locale.fromSubtags(
      languageCode: languageCode,
      scriptCode: normalizedScriptCode.isEmpty ? null : normalizedScriptCode,
    );
  }

  /// --- Setters --- ///
  @override
  Future<void> setHapticsEnabled({required bool enabled}) async {
    cache[_hapticsEnabledKey.key] = enabled;
    await _hapticsEnabledKey.set(enabled);
  }

  @override
  Future<void> setNotificationsEnabled({required bool enabled}) async {
    cache[_notificationsEnabledKey.key] = enabled;
    await _notificationsEnabledKey.set(enabled);
  }

  @override
  Future<void> setLocalization(Locale locale) async {
    final String tag = switch (locale.scriptCode) {
      final String code when code.isNotEmpty => '${locale.languageCode}-$code',
      _ => locale.languageCode,
    };
    cache[_localizationKey.key] = tag;
    await _localizationKey.set(tag);
  }

  @override
  Future<void> setTheme(ThemeMode mode) async {
    cache[_themeKey.key] = mode.name;
    await _themeKey.set(mode.name);
  }
}
