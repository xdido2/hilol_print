import 'package:flutter/material.dart';

@immutable
class SettingsState {
  const SettingsState({required this.locale, required this.themeMode});

  final Locale locale;
  final ThemeMode themeMode;

  SettingsState copyWith({Locale? locale, ThemeMode? themeMode}) =>
      SettingsState(locale: locale ?? this.locale, themeMode: themeMode ?? this.themeMode);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsState &&
          runtimeType == other.runtimeType &&
          locale == other.locale &&
          themeMode == other.themeMode;

  @override
  int get hashCode => locale.hashCode ^ themeMode.hashCode;
}
