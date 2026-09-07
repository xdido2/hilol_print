import 'package:flutter/material.dart';

abstract class SettingsRepository {
  Locale get locale;
  Future<void> setLocale(Locale locale);

  ThemeMode get themeMode;
  Future<void> setThemeMode(ThemeMode themeMode);
}
