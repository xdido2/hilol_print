// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get loginLanguageSheetTitle => 'Tilni tanlang';

  @override
  String get loginLanguageSheetSelectButton => 'Tanlash';

  @override
  String get loginLanguageRussian => 'Русский';

  @override
  String get loginLanguageUzbek => 'O‘zbekcha';

  @override
  String get loginLanguageEnglish => 'English';

  @override
  String get loginPhoneNotFoundError => 'Telefon raqami topilmadi';

  @override
  String get loginRegistrationTitle => 'Kirish';

  @override
  String get loginRegistrationSubtitle => 'Davom etish uchun telefon raqamingizni kiriting';

  @override
  String get loginPhoneLabel => 'Telefon raqami';

  @override
  String get loginPhoneHint => '99 123 45 67';

  @override
  String get loginPhonePrefix => '+998';

  @override
  String get loginContinueButton => 'Davom etish';

  @override
  String get loginAgreementPrefix => 'Davom etish orqali siz ';

  @override
  String get loginAgreementTerms => 'Foydalanish shartlari';

  @override
  String get loginAgreementMiddle => ' va ';

  @override
  String get loginAgreementPrivacyPolicy => 'Maxfiylik siyosati';

  @override
  String get loginAgreementSuffix => ' bilan tanishganingizni tasdiqlaysiz.';

  @override
  String get otpGenericError => 'Nimadir xato ketdi. Qayta urinib ko‘ring.';

  @override
  String get otpSmsResent => 'SMS-kod qayta yuborildi';

  @override
  String get otpTitle => 'Tasdiqlash';

  @override
  String otpSubtitle(Object phone) {
    return '$phone raqamiga yuborilgan kodni kiriting';
  }

  @override
  String get otpResendSms => 'SMSni qayta yuborish';

  @override
  String otpResendSmsIn(Object time) {
    return '$time dan so‘ng qayta yuborish';
  }

  @override
  String get otpConfirmButton => 'Tasdiqlash';

  @override
  String get homeTitle => 'Bosh sahifa';

  @override
  String get homeMyClassesSectionTitle => 'Mening sinflarim';

  @override
  String get homeTodayLessonsSectionTitle => 'Bugungi darslar';

  @override
  String get homeAllButton => 'Barchasi';

  @override
  String get homeLoadError => 'Yuklashda xatolik';

  @override
  String get homeRetryButton => 'Qayta urinish';

  @override
  String get homeNotifications => 'Bildirishnomalar';

  @override
  String get homeAllClasses => 'Barcha sinflar';

  @override
  String get homeAllLessons => 'Barcha darslar';

  @override
  String get homeLessonStatusCompleted => 'Yakunlangan';

  @override
  String get homeLessonStatusNow => 'Hozir';

  @override
  String get homeLessonStatusUpcoming => 'Tez orada';

  @override
  String get commonLoading => 'Yuklanmoqda';

  @override
  String get commonError => 'Xatolik';

  @override
  String get commonLoadError => 'Yuklashda xatolik';

  @override
  String get commonRetry => 'Qayta urinish';

  @override
  String commonPageNotFound(Object error) {
    return 'Sahifa topilmadi: $error';
  }

  @override
  String get commonInvalidOtpRequest => 'OTP so‘rovi noto‘g‘ri';

  @override
  String comingSoonWithTitle(Object title) {
    return '$title (tez orada)';
  }

  @override
  String get mainNavHome => 'Bosh sahifa';

  @override
  String get mainNavJournal => 'Jurnal';

  @override
  String get mainNavChats => 'Chatlar';

  @override
  String get mainNavProfile => 'Profil';

  @override
  String get journalTitle => 'Jurnal';

  @override
  String get chatTitle => 'Chatlar';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileMenuSettings => 'Sozlamalar';

  @override
  String get profileMenuTerms => 'Foydalanish qoidalari';

  @override
  String get profileMenuSupport => 'Yordam';

  @override
  String get profileSupportTelegram => 'Telegram orqali yozish';

  @override
  String get profileMenuLogout => 'Chiqish';

  @override
  String get profileLogoutConfirmTitle => 'Hisobdan chiqmoqchimisiz?';

  @override
  String get profilePersonalDataTitle => 'Shaxsiy ma\'lumotlar';

  @override
  String get profilePersonalDataIdLabel => 'ID';

  @override
  String get profilePersonalDataDobLabel => 'Tug\'ilgan sana';

  @override
  String get profilePersonalDataGenderLabel => 'Jinsi';

  @override
  String get profilePersonalDataPhoneLabel => 'Bog\'lanish telefoni';

  @override
  String get profilePersonalDataAddressLabel => 'Manzil';

  @override
  String get profilePersonalDataPassportLabel => 'Pasport seriya va raqami';

  @override
  String get profileAvatarSheetTitle => 'Avatar';

  @override
  String get profileAvatarSheetGallery => 'Galereyadan yuklash';

  @override
  String get profileAvatarSheetCamera => 'Rasmga olish';

  @override
  String get profileAvatarSheetSetPhoto => 'Rasmni o\'rnatish';

  @override
  String get profileAvatarSheetDeletePhoto => 'Rasmni o‘chirish';

  @override
  String get settingsLanguageTitle => 'Til';

  @override
  String get commonNo => 'Yo‘q';

  @override
  String get commonYes => 'Ha';

  @override
  String get cardAddTitle => 'Karta qo‘shish';

  @override
  String get cardNumberLabel => 'Karta raqami';

  @override
  String get cardNumberHint => '0000 0000 0000 0000';

  @override
  String get cardNumberError => 'Karta raqamining 16 ta raqamini kiriting';

  @override
  String get cardExpiryLabel => 'Amal qilish muddati';

  @override
  String get cardExpiryHint => 'MM/YY';

  @override
  String get cardExpiryError => 'To‘g‘ri amal qilish muddatini kiriting';

  @override
  String get cardPreviewValidThru => 'VALID THRU';

  @override
  String get cardScanButton => 'Skanerlash';

  @override
  String get cardNfcButton => 'NFC';

  @override
  String get cardSaveButton => 'Karta qo‘shish';

  @override
  String get commonOr => 'yoki';

  @override
  String get cardScannerTitle => 'Kartani skanerlash';

  @override
  String get cardScannerHint => 'Kartani ramka ichiga joylashtiring';

  @override
  String get cardScannerRecognizedHint => 'Karta aniqlandi';

  @override
  String get cardScannerManualInput => 'Qo‘lda kiritish';

  @override
  String get cardScannerUseResult => 'Ma’lumotlardan foydalanish';

  @override
  String get cardScannerPermissionTitle => 'Kameraga ruxsat kerak';

  @override
  String get cardScannerPermissionSubtitle => 'Karta ma’lumotlarini skanerlash uchun kameraga ruxsat bering.';

  @override
  String get cardScannerPermissionSettingsHint =>
      'Kameraga ruxsat o‘chirilgan. Kartani skanerlash uchun uni tizim sozlamalarida yoqing.';

  @override
  String get cardScannerPermissionAllow => 'Ruxsat berish';

  @override
  String get cardScannerPermissionOpenSettings => 'Sozlamalarni ochish';

  @override
  String get cardNfcDialogTitle => 'Kartani yaqinlashtiring';

  @override
  String get cardNfcDialogSubtitle => 'Ma’lumotlar o‘qib bo‘lguncha kartani telefonning orqa qismida ushlab turing';

  @override
  String get cardNfcDialogSuccessTitle => 'Karta o‘qildi';

  @override
  String get cardNfcDialogSuccessSubtitle => 'Karta ma’lumotlari formaga joylashtirildi';

  @override
  String get cardNfcDialogErrorTitle => 'Kartani o‘qib bo‘lmadi';

  @override
  String get cardNfcDialogErrorSubtitle => 'Kartani olib, qaytadan urinib ko‘ring';

  @override
  String get cardNfcDialogRetry => 'Qayta urinish';

  @override
  String get cardNfcDialogCancel => 'Bekor qilish';

  @override
  String get cardNfcDialogClose => 'Yopish';

  @override
  String get cardAddSuccess => 'Karta qo‘shildi';

  @override
  String get cardDuplicateError => 'Bu karta allaqachon qo‘shilgan';

  @override
  String get cardAddError => 'Kartani qo‘shib bo‘lmadi. Qayta urinib ko‘ring.';

  @override
  String get cardsSectionTitle => 'Mening kartalarim';

  @override
  String get cardsEmptyTitle => 'Hozircha kartalar yo‘q';

  @override
  String get cardsEmptySubtitle => 'Birinchi kartangizni qo‘shing — u shu yerda ko‘rinadi.';

  @override
  String get cardsLoadError => 'Saqlangan kartalarni yuklab bo‘lmadi.';
}
