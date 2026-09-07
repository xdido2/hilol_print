// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get loginLanguageSheetTitle => 'Выберите язык';

  @override
  String get loginLanguageSheetSelectButton => 'Выбрать';

  @override
  String get loginLanguageRussian => 'Русский';

  @override
  String get loginLanguageUzbek => 'O‘zbekcha';

  @override
  String get loginLanguageEnglish => 'English';

  @override
  String get loginPhoneNotFoundError => 'Номер телефона не найден';

  @override
  String get loginRegistrationTitle => 'Вход';

  @override
  String get loginRegistrationSubtitle => 'Введите номер телефона, чтобы продолжить';

  @override
  String get loginPhoneLabel => 'Номер телефона';

  @override
  String get loginPhoneHint => '99 123 45 67';

  @override
  String get loginPhonePrefix => '+998';

  @override
  String get loginContinueButton => 'Продолжить';

  @override
  String get loginAgreementPrefix => 'Продолжая, вы соглашаетесь с ';

  @override
  String get loginAgreementTerms => 'Условиями использования';

  @override
  String get loginAgreementMiddle => ' и ';

  @override
  String get loginAgreementPrivacyPolicy => 'Политикой конфиденциальности';

  @override
  String get loginAgreementSuffix => '.';

  @override
  String get otpGenericError => 'Что-то пошло не так. Попробуйте снова.';

  @override
  String get otpSmsResent => 'SMS-код отправлен повторно';

  @override
  String get otpTitle => 'Подтверждение';

  @override
  String otpSubtitle(Object phone) {
    return 'Введите код, отправленный на $phone';
  }

  @override
  String get otpResendSms => 'Отправить снова';

  @override
  String otpResendSmsIn(Object time) {
    return 'Отправить снова через $time';
  }

  @override
  String get otpConfirmButton => 'Подтвердить';

  @override
  String get homeTitle => 'Главная';

  @override
  String get homeMyClassesSectionTitle => 'Мои классы';

  @override
  String get homeTodayLessonsSectionTitle => 'Уроки сегодня';

  @override
  String get homeAllButton => 'Все';

  @override
  String get homeLoadError => 'Ошибка загрузки';

  @override
  String get homeRetryButton => 'Повторить';

  @override
  String get homeNotifications => 'Уведомления';

  @override
  String get homeAllClasses => 'Все классы';

  @override
  String get homeAllLessons => 'Все уроки';

  @override
  String get homeLessonStatusCompleted => 'Завершен';

  @override
  String get homeLessonStatusNow => 'Сейчас';

  @override
  String get homeLessonStatusUpcoming => 'Скоро';

  @override
  String get commonLoading => 'Загрузка';

  @override
  String get commonError => 'Ошибка';

  @override
  String get commonLoadError => 'Ошибка загрузки';

  @override
  String get commonRetry => 'Повторить';

  @override
  String commonPageNotFound(Object error) {
    return 'Страница не найдена: $error';
  }

  @override
  String get commonInvalidOtpRequest => 'Неверный запрос OTP';

  @override
  String comingSoonWithTitle(Object title) {
    return '$title (скоро)';
  }

  @override
  String get mainNavHome => 'Главная';

  @override
  String get mainNavJournal => 'Журнал';

  @override
  String get mainNavChats => 'Чаты';

  @override
  String get mainNavProfile => 'Профиль';

  @override
  String get journalTitle => 'Журнал';

  @override
  String get chatTitle => 'Чаты';

  @override
  String get profileTitle => 'Профиль';

  @override
  String get profileMenuSettings => 'Настройки';

  @override
  String get profileMenuTerms => 'Правила использования';

  @override
  String get profileMenuSupport => 'Поддержка';

  @override
  String get profileSupportTelegram => 'Написать через Telegram';

  @override
  String get profileMenuLogout => 'Выход';

  @override
  String get profileLogoutConfirmTitle => 'Вы точно хотите выйти с аккаунта?';

  @override
  String get profilePersonalDataTitle => 'Личные данные';

  @override
  String get profilePersonalDataIdLabel => 'ID';

  @override
  String get profilePersonalDataDobLabel => 'Дата рождения';

  @override
  String get profilePersonalDataGenderLabel => 'Пол';

  @override
  String get profilePersonalDataPhoneLabel => 'Телефон номер для связи';

  @override
  String get profilePersonalDataAddressLabel => 'Адрес';

  @override
  String get profilePersonalDataPassportLabel => 'Серия и номер паспорта';

  @override
  String get profileAvatarSheetTitle => 'Аватар';

  @override
  String get profileAvatarSheetGallery => 'Загрузить из галереи';

  @override
  String get profileAvatarSheetCamera => 'Сделать снимок';

  @override
  String get profileAvatarSheetSetPhoto => 'Установить фото';

  @override
  String get profileAvatarSheetDeletePhoto => 'Удалить фото';

  @override
  String get settingsLanguageTitle => 'Язык';

  @override
  String get commonNo => 'Нет';

  @override
  String get commonYes => 'Да';

  @override
  String get cardAddTitle => 'Добавить карту';

  @override
  String get cardNumberLabel => 'Номер карты';

  @override
  String get cardNumberHint => '0000 0000 0000 0000';

  @override
  String get cardNumberError => 'Введите все 16 цифр карты';

  @override
  String get cardExpiryLabel => 'Срок действия';

  @override
  String get cardExpiryHint => 'MM/YY';

  @override
  String get cardExpiryError => 'Введите корректный срок действия';

  @override
  String get cardPreviewValidThru => 'VALID THRU';

  @override
  String get cardScanButton => 'Сканировать';

  @override
  String get cardNfcButton => 'NFC';

  @override
  String get cardSaveButton => 'Добавить карту';

  @override
  String get commonOr => 'или';

  @override
  String get cardScannerTitle => 'Сканирование карты';

  @override
  String get cardScannerHint => 'Поместите карту в рамку';

  @override
  String get cardScannerRecognizedHint => 'Карта распознана';

  @override
  String get cardScannerManualInput => 'Ввести вручную';

  @override
  String get cardScannerUseResult => 'Использовать данные';

  @override
  String get cardScannerPermissionTitle => 'Нужен доступ к камере';

  @override
  String get cardScannerPermissionSubtitle => 'Разрешите доступ к камере, чтобы отсканировать данные карты.';

  @override
  String get cardScannerPermissionSettingsHint =>
      'Доступ к камере отключён. Включите его в настройках системы, чтобы сканировать карту.';

  @override
  String get cardScannerPermissionAllow => 'Разрешить доступ';

  @override
  String get cardScannerPermissionOpenSettings => 'Открыть настройки';

  @override
  String get cardNfcDialogTitle => 'Приложите карту';

  @override
  String get cardNfcDialogSubtitle => 'Держите карту у задней панели телефона до конца считывания';

  @override
  String get cardNfcDialogSuccessTitle => 'Карта считана';

  @override
  String get cardNfcDialogSuccessSubtitle => 'Данные карты подставлены в форму';

  @override
  String get cardNfcDialogErrorTitle => 'Не удалось считать карту';

  @override
  String get cardNfcDialogErrorSubtitle => 'Уберите карту и попробуйте ещё раз';

  @override
  String get cardNfcDialogRetry => 'Повторить';

  @override
  String get cardNfcDialogCancel => 'Отмена';

  @override
  String get cardNfcDialogClose => 'Закрыть';

  @override
  String get cardAddSuccess => 'Карта добавлена';

  @override
  String get cardDuplicateError => 'Эта карта уже добавлена';

  @override
  String get cardAddError => 'Не удалось добавить карту. Попробуйте снова.';

  @override
  String get cardsSectionTitle => 'Мои карты';

  @override
  String get cardsEmptyTitle => 'Карт пока нет';

  @override
  String get cardsEmptySubtitle => 'Добавьте первую карту — она появится здесь.';

  @override
  String get cardsLoadError => 'Не удалось загрузить сохранённые карты.';
}
