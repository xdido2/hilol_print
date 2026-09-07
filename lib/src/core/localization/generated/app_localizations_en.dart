// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginLanguageSheetTitle => 'Choose language';

  @override
  String get loginLanguageSheetSelectButton => 'Select';

  @override
  String get loginLanguageRussian => 'Русский';

  @override
  String get loginLanguageUzbek => 'O‘zbekcha';

  @override
  String get loginLanguageEnglish => 'English';

  @override
  String get loginPhoneNotFoundError => 'Phone number not found';

  @override
  String get loginRegistrationTitle => 'Sign in';

  @override
  String get loginRegistrationSubtitle => 'Enter your phone number to continue';

  @override
  String get loginPhoneLabel => 'Phone number';

  @override
  String get loginPhoneHint => '99 123 45 67';

  @override
  String get loginPhonePrefix => '+998';

  @override
  String get loginContinueButton => 'Continue';

  @override
  String get loginAgreementPrefix => 'By continuing, you agree to the ';

  @override
  String get loginAgreementTerms => 'Terms of Service';

  @override
  String get loginAgreementMiddle => ' and ';

  @override
  String get loginAgreementPrivacyPolicy => 'Privacy Policy';

  @override
  String get loginAgreementSuffix => '.';

  @override
  String get otpGenericError => 'Something went wrong. Try again.';

  @override
  String get otpSmsResent => 'SMS code resent';

  @override
  String get otpTitle => 'Verification';

  @override
  String otpSubtitle(Object phone) {
    return 'Enter the code sent to $phone';
  }

  @override
  String get otpResendSms => 'Resend SMS';

  @override
  String otpResendSmsIn(Object time) {
    return 'Resend in $time';
  }

  @override
  String get otpConfirmButton => 'Confirm';

  @override
  String get homeTitle => 'Home';

  @override
  String get homeMyClassesSectionTitle => 'My classes';

  @override
  String get homeTodayLessonsSectionTitle => 'Lessons today';

  @override
  String get homeAllButton => 'All';

  @override
  String get homeLoadError => 'Failed to load';

  @override
  String get homeRetryButton => 'Retry';

  @override
  String get homeNotifications => 'Notifications';

  @override
  String get homeAllClasses => 'All classes';

  @override
  String get homeAllLessons => 'All lessons';

  @override
  String get homeLessonStatusCompleted => 'Completed';

  @override
  String get homeLessonStatusNow => 'Now';

  @override
  String get homeLessonStatusUpcoming => 'Upcoming';

  @override
  String get commonLoading => 'Loading';

  @override
  String get commonError => 'Error';

  @override
  String get commonLoadError => 'Failed to load';

  @override
  String get commonRetry => 'Retry';

  @override
  String commonPageNotFound(Object error) {
    return 'Page not found: $error';
  }

  @override
  String get commonInvalidOtpRequest => 'Invalid OTP request';

  @override
  String comingSoonWithTitle(Object title) {
    return '$title (coming soon)';
  }

  @override
  String get mainNavHome => 'Home';

  @override
  String get mainNavJournal => 'Journal';

  @override
  String get mainNavChats => 'Chats';

  @override
  String get mainNavProfile => 'Profile';

  @override
  String get journalTitle => 'Journal';

  @override
  String get chatTitle => 'Chats';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileMenuSettings => 'Settings';

  @override
  String get profileMenuTerms => 'Terms of use';

  @override
  String get profileMenuSupport => 'Support';

  @override
  String get profileSupportTelegram => 'Write via Telegram';

  @override
  String get profileMenuLogout => 'Logout';

  @override
  String get profileLogoutConfirmTitle => 'Are you sure you want to log out?';

  @override
  String get profilePersonalDataTitle => 'Personal data';

  @override
  String get profilePersonalDataIdLabel => 'ID';

  @override
  String get profilePersonalDataDobLabel => 'Date of birth';

  @override
  String get profilePersonalDataGenderLabel => 'Gender';

  @override
  String get profilePersonalDataPhoneLabel => 'Contact phone number';

  @override
  String get profilePersonalDataAddressLabel => 'Address';

  @override
  String get profilePersonalDataPassportLabel => 'Passport series and number';

  @override
  String get profileAvatarSheetTitle => 'Avatar';

  @override
  String get profileAvatarSheetGallery => 'Upload from gallery';

  @override
  String get profileAvatarSheetCamera => 'Take a photo';

  @override
  String get profileAvatarSheetSetPhoto => 'Set photo';

  @override
  String get profileAvatarSheetDeletePhoto => 'Delete photo';

  @override
  String get settingsLanguageTitle => 'Language';

  @override
  String get commonNo => 'No';

  @override
  String get commonYes => 'Yes';

  @override
  String get cardAddTitle => 'Add card';

  @override
  String get cardNumberLabel => 'Card number';

  @override
  String get cardNumberHint => '0000 0000 0000 0000';

  @override
  String get cardNumberError => 'Enter all 16 digits of the card';

  @override
  String get cardExpiryLabel => 'Expiry date';

  @override
  String get cardExpiryHint => 'MM/YY';

  @override
  String get cardExpiryError => 'Enter a valid expiry date';

  @override
  String get cardPreviewValidThru => 'VALID THRU';

  @override
  String get cardScanButton => 'Scan';

  @override
  String get cardNfcButton => 'NFC';

  @override
  String get cardSaveButton => 'Add card';

  @override
  String get commonOr => 'or';

  @override
  String get cardScannerTitle => 'Card scanning';

  @override
  String get cardScannerHint => 'Place the card inside the frame';

  @override
  String get cardScannerRecognizedHint => 'Card recognized';

  @override
  String get cardScannerManualInput => 'Enter manually';

  @override
  String get cardScannerUseResult => 'Use data';

  @override
  String get cardScannerPermissionTitle => 'Camera access needed';

  @override
  String get cardScannerPermissionSubtitle => 'Allow camera access to scan the card details.';

  @override
  String get cardScannerPermissionSettingsHint =>
      'Camera access is turned off. Enable it in the system settings to scan the card.';

  @override
  String get cardScannerPermissionAllow => 'Allow access';

  @override
  String get cardScannerPermissionOpenSettings => 'Open settings';

  @override
  String get cardNfcDialogTitle => 'Tap your card';

  @override
  String get cardNfcDialogSubtitle => 'Hold the card against the back of the phone until reading is finished';

  @override
  String get cardNfcDialogSuccessTitle => 'Card read';

  @override
  String get cardNfcDialogSuccessSubtitle => 'The card details are filled in the form';

  @override
  String get cardNfcDialogErrorTitle => 'Could not read the card';

  @override
  String get cardNfcDialogErrorSubtitle => 'Move the card away and try again';

  @override
  String get cardNfcDialogRetry => 'Try again';

  @override
  String get cardNfcDialogCancel => 'Cancel';

  @override
  String get cardNfcDialogClose => 'Close';

  @override
  String get cardAddSuccess => 'Card added';

  @override
  String get cardDuplicateError => 'This card has already been added';

  @override
  String get cardAddError => 'Could not add the card. Try again.';

  @override
  String get cardsSectionTitle => 'My cards';

  @override
  String get cardsEmptyTitle => 'No cards yet';

  @override
  String get cardsEmptySubtitle => 'Add your first card and it will show up here.';

  @override
  String get cardsLoadError => 'Could not load the saved cards.';
}
