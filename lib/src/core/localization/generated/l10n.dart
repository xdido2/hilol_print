// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class GeneratedLocalization {
  GeneratedLocalization();

  static GeneratedLocalization? _current;

  static GeneratedLocalization get current {
    assert(
      _current != null,
      'No instance of GeneratedLocalization was loaded. Try to initialize the GeneratedLocalization delegate before accessing GeneratedLocalization.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<GeneratedLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = GeneratedLocalization();
      GeneratedLocalization._current = instance;

      return instance;
    });
  }

  static GeneratedLocalization of(BuildContext context) {
    final instance = GeneratedLocalization.maybeOf(context);
    assert(
      instance != null,
      'No instance of GeneratedLocalization present in the widget tree. Did you add GeneratedLocalization.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static GeneratedLocalization? maybeOf(BuildContext context) {
    return Localizations.of<GeneratedLocalization>(context, GeneratedLocalization);
  }

  /// `Выберите язык`
  String get loginLanguageSheetTitle {
    return Intl.message('Выберите язык', name: 'loginLanguageSheetTitle', desc: '', args: []);
  }

  /// `Выбрать`
  String get loginLanguageSheetSelectButton {
    return Intl.message('Выбрать', name: 'loginLanguageSheetSelectButton', desc: '', args: []);
  }

  /// `Русский`
  String get loginLanguageRussian {
    return Intl.message('Русский', name: 'loginLanguageRussian', desc: '', args: []);
  }

  /// `O‘zbekcha`
  String get loginLanguageUzbek {
    return Intl.message('O‘zbekcha', name: 'loginLanguageUzbek', desc: '', args: []);
  }

  /// `English`
  String get loginLanguageEnglish {
    return Intl.message('English', name: 'loginLanguageEnglish', desc: '', args: []);
  }

  /// `Номер телефона не найден`
  String get loginPhoneNotFoundError {
    return Intl.message('Номер телефона не найден', name: 'loginPhoneNotFoundError', desc: '', args: []);
  }

  /// `Вход`
  String get loginRegistrationTitle {
    return Intl.message('Вход', name: 'loginRegistrationTitle', desc: '', args: []);
  }

  /// `Введите номер телефона, чтобы продолжить`
  String get loginRegistrationSubtitle {
    return Intl.message(
      'Введите номер телефона, чтобы продолжить',
      name: 'loginRegistrationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Номер телефона`
  String get loginPhoneLabel {
    return Intl.message('Номер телефона', name: 'loginPhoneLabel', desc: '', args: []);
  }

  /// `99 123 45 67`
  String get loginPhoneHint {
    return Intl.message('99 123 45 67', name: 'loginPhoneHint', desc: '', args: []);
  }

  /// `+998`
  String get loginPhonePrefix {
    return Intl.message('+998', name: 'loginPhonePrefix', desc: '', args: []);
  }

  /// `Продолжить`
  String get loginContinueButton {
    return Intl.message('Продолжить', name: 'loginContinueButton', desc: '', args: []);
  }

  /// `Продолжая, вы соглашаетесь с `
  String get loginAgreementPrefix {
    return Intl.message('Продолжая, вы соглашаетесь с ', name: 'loginAgreementPrefix', desc: '', args: []);
  }

  /// `Условиями использования`
  String get loginAgreementTerms {
    return Intl.message('Условиями использования', name: 'loginAgreementTerms', desc: '', args: []);
  }

  /// ` и `
  String get loginAgreementMiddle {
    return Intl.message(' и ', name: 'loginAgreementMiddle', desc: '', args: []);
  }

  /// `Политикой конфиденциальности`
  String get loginAgreementPrivacyPolicy {
    return Intl.message('Политикой конфиденциальности', name: 'loginAgreementPrivacyPolicy', desc: '', args: []);
  }

  /// `.`
  String get loginAgreementSuffix {
    return Intl.message('.', name: 'loginAgreementSuffix', desc: '', args: []);
  }

  /// `Что-то пошло не так. Попробуйте снова.`
  String get otpGenericError {
    return Intl.message('Что-то пошло не так. Попробуйте снова.', name: 'otpGenericError', desc: '', args: []);
  }

  /// `SMS-код отправлен повторно`
  String get otpSmsResent {
    return Intl.message('SMS-код отправлен повторно', name: 'otpSmsResent', desc: '', args: []);
  }

  /// `Подтверждение`
  String get otpTitle {
    return Intl.message('Подтверждение', name: 'otpTitle', desc: '', args: []);
  }

  /// `Введите код, отправленный на {phone}`
  String otpSubtitle(Object phone) {
    return Intl.message('Введите код, отправленный на $phone', name: 'otpSubtitle', desc: '', args: [phone]);
  }

  /// `Отправить снова`
  String get otpResendSms {
    return Intl.message('Отправить снова', name: 'otpResendSms', desc: '', args: []);
  }

  /// `Отправить снова через {time}`
  String otpResendSmsIn(Object time) {
    return Intl.message('Отправить снова через $time', name: 'otpResendSmsIn', desc: '', args: [time]);
  }

  /// `Подтвердить`
  String get otpConfirmButton {
    return Intl.message('Подтвердить', name: 'otpConfirmButton', desc: '', args: []);
  }

  /// `Главная`
  String get homeTitle {
    return Intl.message('Главная', name: 'homeTitle', desc: '', args: []);
  }

  /// `Мои классы`
  String get homeMyClassesSectionTitle {
    return Intl.message('Мои классы', name: 'homeMyClassesSectionTitle', desc: '', args: []);
  }

  /// `Уроки сегодня`
  String get homeTodayLessonsSectionTitle {
    return Intl.message('Уроки сегодня', name: 'homeTodayLessonsSectionTitle', desc: '', args: []);
  }

  /// `Все`
  String get homeAllButton {
    return Intl.message('Все', name: 'homeAllButton', desc: '', args: []);
  }

  /// `Ошибка загрузки`
  String get homeLoadError {
    return Intl.message('Ошибка загрузки', name: 'homeLoadError', desc: '', args: []);
  }

  /// `Повторить`
  String get homeRetryButton {
    return Intl.message('Повторить', name: 'homeRetryButton', desc: '', args: []);
  }

  /// `Уведомления`
  String get homeNotifications {
    return Intl.message('Уведомления', name: 'homeNotifications', desc: '', args: []);
  }

  /// `Все классы`
  String get homeAllClasses {
    return Intl.message('Все классы', name: 'homeAllClasses', desc: '', args: []);
  }

  /// `Все уроки`
  String get homeAllLessons {
    return Intl.message('Все уроки', name: 'homeAllLessons', desc: '', args: []);
  }

  /// `Завершен`
  String get homeLessonStatusCompleted {
    return Intl.message('Завершен', name: 'homeLessonStatusCompleted', desc: '', args: []);
  }

  /// `Сейчас`
  String get homeLessonStatusNow {
    return Intl.message('Сейчас', name: 'homeLessonStatusNow', desc: '', args: []);
  }

  /// `Скоро`
  String get homeLessonStatusUpcoming {
    return Intl.message('Скоро', name: 'homeLessonStatusUpcoming', desc: '', args: []);
  }

  /// `Загрузка`
  String get commonLoading {
    return Intl.message('Загрузка', name: 'commonLoading', desc: '', args: []);
  }

  /// `Ошибка`
  String get commonError {
    return Intl.message('Ошибка', name: 'commonError', desc: '', args: []);
  }

  /// `Ошибка загрузки`
  String get commonLoadError {
    return Intl.message('Ошибка загрузки', name: 'commonLoadError', desc: '', args: []);
  }

  /// `Повторить`
  String get commonRetry {
    return Intl.message('Повторить', name: 'commonRetry', desc: '', args: []);
  }

  /// `Страница не найдена: {error}`
  String commonPageNotFound(Object error) {
    return Intl.message('Страница не найдена: $error', name: 'commonPageNotFound', desc: '', args: [error]);
  }

  /// `Неверный запрос OTP`
  String get commonInvalidOtpRequest {
    return Intl.message('Неверный запрос OTP', name: 'commonInvalidOtpRequest', desc: '', args: []);
  }

  /// `{title} (скоро)`
  String comingSoonWithTitle(Object title) {
    return Intl.message('$title (скоро)', name: 'comingSoonWithTitle', desc: '', args: [title]);
  }

  /// `Главная`
  String get mainNavHome {
    return Intl.message('Главная', name: 'mainNavHome', desc: '', args: []);
  }

  /// `Журнал`
  String get mainNavJournal {
    return Intl.message('Журнал', name: 'mainNavJournal', desc: '', args: []);
  }

  /// `Чаты`
  String get mainNavChats {
    return Intl.message('Чаты', name: 'mainNavChats', desc: '', args: []);
  }

  /// `Профиль`
  String get mainNavProfile {
    return Intl.message('Профиль', name: 'mainNavProfile', desc: '', args: []);
  }

  /// `Журнал`
  String get journalTitle {
    return Intl.message('Журнал', name: 'journalTitle', desc: '', args: []);
  }

  /// `Чаты`
  String get chatTitle {
    return Intl.message('Чаты', name: 'chatTitle', desc: '', args: []);
  }

  /// `Профиль`
  String get profileTitle {
    return Intl.message('Профиль', name: 'profileTitle', desc: '', args: []);
  }

  /// `Настройки`
  String get profileMenuSettings {
    return Intl.message('Настройки', name: 'profileMenuSettings', desc: '', args: []);
  }

  /// `Правила использования`
  String get profileMenuTerms {
    return Intl.message('Правила использования', name: 'profileMenuTerms', desc: '', args: []);
  }

  /// `Поддержка`
  String get profileMenuSupport {
    return Intl.message('Поддержка', name: 'profileMenuSupport', desc: '', args: []);
  }

  /// `Написать через Telegram`
  String get profileSupportTelegram {
    return Intl.message('Написать через Telegram', name: 'profileSupportTelegram', desc: '', args: []);
  }

  /// `Выход`
  String get profileMenuLogout {
    return Intl.message('Выход', name: 'profileMenuLogout', desc: '', args: []);
  }

  /// `Вы точно хотите выйти с аккаунта?`
  String get profileLogoutConfirmTitle {
    return Intl.message('Вы точно хотите выйти с аккаунта?', name: 'profileLogoutConfirmTitle', desc: '', args: []);
  }

  /// `Личные данные`
  String get profilePersonalDataTitle {
    return Intl.message('Личные данные', name: 'profilePersonalDataTitle', desc: '', args: []);
  }

  /// `ID`
  String get profilePersonalDataIdLabel {
    return Intl.message('ID', name: 'profilePersonalDataIdLabel', desc: '', args: []);
  }

  /// `Дата рождения`
  String get profilePersonalDataDobLabel {
    return Intl.message('Дата рождения', name: 'profilePersonalDataDobLabel', desc: '', args: []);
  }

  /// `Пол`
  String get profilePersonalDataGenderLabel {
    return Intl.message('Пол', name: 'profilePersonalDataGenderLabel', desc: '', args: []);
  }

  /// `Телефон номер для связи`
  String get profilePersonalDataPhoneLabel {
    return Intl.message('Телефон номер для связи', name: 'profilePersonalDataPhoneLabel', desc: '', args: []);
  }

  /// `Адрес`
  String get profilePersonalDataAddressLabel {
    return Intl.message('Адрес', name: 'profilePersonalDataAddressLabel', desc: '', args: []);
  }

  /// `Серия и номер паспорта`
  String get profilePersonalDataPassportLabel {
    return Intl.message('Серия и номер паспорта', name: 'profilePersonalDataPassportLabel', desc: '', args: []);
  }

  /// `Аватар`
  String get profileAvatarSheetTitle {
    return Intl.message('Аватар', name: 'profileAvatarSheetTitle', desc: '', args: []);
  }

  /// `Загрузить из галереи`
  String get profileAvatarSheetGallery {
    return Intl.message('Загрузить из галереи', name: 'profileAvatarSheetGallery', desc: '', args: []);
  }

  /// `Сделать снимок`
  String get profileAvatarSheetCamera {
    return Intl.message('Сделать снимок', name: 'profileAvatarSheetCamera', desc: '', args: []);
  }

  /// `Установить фото`
  String get profileAvatarSheetSetPhoto {
    return Intl.message('Установить фото', name: 'profileAvatarSheetSetPhoto', desc: '', args: []);
  }

  /// `Удалить фото`
  String get profileAvatarSheetDeletePhoto {
    return Intl.message('Удалить фото', name: 'profileAvatarSheetDeletePhoto', desc: '', args: []);
  }

  /// `Язык`
  String get settingsLanguageTitle {
    return Intl.message('Язык', name: 'settingsLanguageTitle', desc: '', args: []);
  }

  /// `Нет`
  String get commonNo {
    return Intl.message('Нет', name: 'commonNo', desc: '', args: []);
  }

  /// `Да`
  String get commonYes {
    return Intl.message('Да', name: 'commonYes', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<GeneratedLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'uz'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<GeneratedLocalization> load(Locale locale) => GeneratedLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
