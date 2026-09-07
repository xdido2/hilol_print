import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../localization/generated/app_localizations.dart';
import '../../domain/repository/settings_repository.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository,
      super(
        SettingsState(locale: _normalizeLocale(settingsRepository.locale), themeMode: settingsRepository.themeMode),
      );

  final SettingsRepository _settingsRepository;

  static Locale _normalizeLocale(Locale locale) {
    final List<Locale> supported = AppLocalizations.supportedLocales;
    for (final Locale candidate in supported) {
      if (candidate.languageCode == locale.languageCode && (candidate.scriptCode ?? '') == (locale.scriptCode ?? '')) {
        return candidate;
      }
    }

    for (final Locale candidate in supported) {
      if (candidate.languageCode == locale.languageCode) return candidate;
    }

    return supported.first;
  }

  Future<void> updateLocale(Locale locale) async {
    final Locale normalized = _normalizeLocale(locale);
    await _settingsRepository.setLocale(normalized);
    emit(state.copyWith(locale: normalized));
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await _settingsRepository.setThemeMode(themeMode);
    emit(state.copyWith(themeMode: themeMode));
  }
}
