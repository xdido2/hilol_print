// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(title) => "${title} (скоро)";

  static String m1(error) => "Страница не найдена: ${error}";

  static String m2(time) => "Отправить снова через ${time}";

  static String m3(phone) => "Введите код, отправленный на ${phone}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "chatTitle": MessageLookupByLibrary.simpleMessage("Чаты"),
    "comingSoonWithTitle": m0,
    "commonError": MessageLookupByLibrary.simpleMessage("Ошибка"),
    "commonInvalidOtpRequest": MessageLookupByLibrary.simpleMessage("Неверный запрос OTP"),
    "commonLoadError": MessageLookupByLibrary.simpleMessage("Ошибка загрузки"),
    "commonLoading": MessageLookupByLibrary.simpleMessage("Загрузка"),
    "commonNo": MessageLookupByLibrary.simpleMessage("Нет"),
    "commonPageNotFound": m1,
    "commonRetry": MessageLookupByLibrary.simpleMessage("Повторить"),
    "commonYes": MessageLookupByLibrary.simpleMessage("Да"),
    "homeAllButton": MessageLookupByLibrary.simpleMessage("Все"),
    "homeAllClasses": MessageLookupByLibrary.simpleMessage("Все классы"),
    "homeAllLessons": MessageLookupByLibrary.simpleMessage("Все уроки"),
    "homeLessonStatusCompleted": MessageLookupByLibrary.simpleMessage("Завершен"),
    "homeLessonStatusNow": MessageLookupByLibrary.simpleMessage("Сейчас"),
    "homeLessonStatusUpcoming": MessageLookupByLibrary.simpleMessage("Скоро"),
    "homeLoadError": MessageLookupByLibrary.simpleMessage("Ошибка загрузки"),
    "homeMyClassesSectionTitle": MessageLookupByLibrary.simpleMessage("Мои классы"),
    "homeNotifications": MessageLookupByLibrary.simpleMessage("Уведомления"),
    "homeRetryButton": MessageLookupByLibrary.simpleMessage("Повторить"),
    "homeTitle": MessageLookupByLibrary.simpleMessage("Главная"),
    "homeTodayLessonsSectionTitle": MessageLookupByLibrary.simpleMessage("Уроки сегодня"),
    "journalTitle": MessageLookupByLibrary.simpleMessage("Журнал"),
    "loginAgreementMiddle": MessageLookupByLibrary.simpleMessage(" и "),
    "loginAgreementPrefix": MessageLookupByLibrary.simpleMessage("Продолжая, вы соглашаетесь с "),
    "loginAgreementPrivacyPolicy": MessageLookupByLibrary.simpleMessage("Политикой конфиденциальности"),
    "loginAgreementSuffix": MessageLookupByLibrary.simpleMessage("."),
    "loginAgreementTerms": MessageLookupByLibrary.simpleMessage("Условиями использования"),
    "loginContinueButton": MessageLookupByLibrary.simpleMessage("Продолжить"),
    "loginLanguageEnglish": MessageLookupByLibrary.simpleMessage("English"),
    "loginLanguageRussian": MessageLookupByLibrary.simpleMessage("Русский"),
    "loginLanguageSheetSelectButton": MessageLookupByLibrary.simpleMessage("Выбрать"),
    "loginLanguageSheetTitle": MessageLookupByLibrary.simpleMessage("Выберите язык"),
    "loginLanguageUzbek": MessageLookupByLibrary.simpleMessage("O‘zbekcha"),
    "loginPhoneHint": MessageLookupByLibrary.simpleMessage("99 123 45 67"),
    "loginPhoneLabel": MessageLookupByLibrary.simpleMessage("Номер телефона"),
    "loginPhoneNotFoundError": MessageLookupByLibrary.simpleMessage("Номер телефона не найден"),
    "loginPhonePrefix": MessageLookupByLibrary.simpleMessage("+998"),
    "loginRegistrationSubtitle": MessageLookupByLibrary.simpleMessage("Введите номер телефона, чтобы продолжить"),
    "loginRegistrationTitle": MessageLookupByLibrary.simpleMessage("Вход"),
    "mainNavChats": MessageLookupByLibrary.simpleMessage("Чаты"),
    "mainNavHome": MessageLookupByLibrary.simpleMessage("Главная"),
    "mainNavJournal": MessageLookupByLibrary.simpleMessage("Журнал"),
    "mainNavProfile": MessageLookupByLibrary.simpleMessage("Профиль"),
    "otpConfirmButton": MessageLookupByLibrary.simpleMessage("Подтвердить"),
    "otpGenericError": MessageLookupByLibrary.simpleMessage("Что-то пошло не так. Попробуйте снова."),
    "otpResendSms": MessageLookupByLibrary.simpleMessage("Отправить снова"),
    "otpResendSmsIn": m2,
    "otpSmsResent": MessageLookupByLibrary.simpleMessage("SMS-код отправлен повторно"),
    "otpSubtitle": m3,
    "otpTitle": MessageLookupByLibrary.simpleMessage("Подтверждение"),
    "profileAvatarSheetCamera": MessageLookupByLibrary.simpleMessage("Сделать снимок"),
    "profileAvatarSheetDeletePhoto": MessageLookupByLibrary.simpleMessage("Удалить фото"),
    "profileAvatarSheetGallery": MessageLookupByLibrary.simpleMessage("Загрузить из галереи"),
    "profileAvatarSheetSetPhoto": MessageLookupByLibrary.simpleMessage("Установить фото"),
    "profileAvatarSheetTitle": MessageLookupByLibrary.simpleMessage("Аватар"),
    "profileLogoutConfirmTitle": MessageLookupByLibrary.simpleMessage("Вы точно хотите выйти с аккаунта?"),
    "profileMenuLogout": MessageLookupByLibrary.simpleMessage("Выход"),
    "profileMenuSettings": MessageLookupByLibrary.simpleMessage("Настройки"),
    "profileMenuSupport": MessageLookupByLibrary.simpleMessage("Поддержка"),
    "profileMenuTerms": MessageLookupByLibrary.simpleMessage("Правила использования"),
    "profilePersonalDataAddressLabel": MessageLookupByLibrary.simpleMessage("Адрес"),
    "profilePersonalDataDobLabel": MessageLookupByLibrary.simpleMessage("Дата рождения"),
    "profilePersonalDataGenderLabel": MessageLookupByLibrary.simpleMessage("Пол"),
    "profilePersonalDataIdLabel": MessageLookupByLibrary.simpleMessage("ID"),
    "profilePersonalDataPassportLabel": MessageLookupByLibrary.simpleMessage("Серия и номер паспорта"),
    "profilePersonalDataPhoneLabel": MessageLookupByLibrary.simpleMessage("Телефон номер для связи"),
    "profilePersonalDataTitle": MessageLookupByLibrary.simpleMessage("Личные данные"),
    "profileSupportTelegram": MessageLookupByLibrary.simpleMessage("Написать через Telegram"),
    "profileTitle": MessageLookupByLibrary.simpleMessage("Профиль"),
    "settingsLanguageTitle": MessageLookupByLibrary.simpleMessage("Язык"),
  };
}
