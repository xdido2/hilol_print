import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('ru'), Locale('uz')];

  /// No description provided for @loginLanguageSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose language'**
  String get loginLanguageSheetTitle;

  /// No description provided for @loginLanguageSheetSelectButton.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get loginLanguageSheetSelectButton;

  /// No description provided for @loginLanguageRussian.
  ///
  /// In en, this message translates to:
  /// **'Русский'**
  String get loginLanguageRussian;

  /// No description provided for @loginLanguageUzbek.
  ///
  /// In en, this message translates to:
  /// **'O‘zbekcha'**
  String get loginLanguageUzbek;

  /// No description provided for @loginLanguageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get loginLanguageEnglish;

  /// No description provided for @loginPhoneNotFoundError.
  ///
  /// In en, this message translates to:
  /// **'Phone number not found'**
  String get loginPhoneNotFoundError;

  /// No description provided for @loginRegistrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginRegistrationTitle;

  /// No description provided for @loginRegistrationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number to continue'**
  String get loginRegistrationSubtitle;

  /// No description provided for @loginPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get loginPhoneLabel;

  /// No description provided for @loginPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'99 123 45 67'**
  String get loginPhoneHint;

  /// No description provided for @loginPhonePrefix.
  ///
  /// In en, this message translates to:
  /// **'+998'**
  String get loginPhonePrefix;

  /// No description provided for @loginContinueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get loginContinueButton;

  /// No description provided for @loginAgreementPrefix.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to the '**
  String get loginAgreementPrefix;

  /// No description provided for @loginAgreementTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get loginAgreementTerms;

  /// No description provided for @loginAgreementMiddle.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get loginAgreementMiddle;

  /// No description provided for @loginAgreementPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get loginAgreementPrivacyPolicy;

  /// No description provided for @loginAgreementSuffix.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get loginAgreementSuffix;

  /// No description provided for @otpGenericError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Try again.'**
  String get otpGenericError;

  /// No description provided for @otpSmsResent.
  ///
  /// In en, this message translates to:
  /// **'SMS code resent'**
  String get otpSmsResent;

  /// No description provided for @otpTitle.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get otpTitle;

  /// No description provided for @otpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the code sent to {phone}'**
  String otpSubtitle(Object phone);

  /// No description provided for @otpResendSms.
  ///
  /// In en, this message translates to:
  /// **'Resend SMS'**
  String get otpResendSms;

  /// No description provided for @otpResendSmsIn.
  ///
  /// In en, this message translates to:
  /// **'Resend in {time}'**
  String otpResendSmsIn(Object time);

  /// No description provided for @otpConfirmButton.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get otpConfirmButton;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTitle;

  /// No description provided for @homeMyClassesSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'My classes'**
  String get homeMyClassesSectionTitle;

  /// No description provided for @homeTodayLessonsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Lessons today'**
  String get homeTodayLessonsSectionTitle;

  /// No description provided for @homeAllButton.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get homeAllButton;

  /// No description provided for @homeLoadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load'**
  String get homeLoadError;

  /// No description provided for @homeRetryButton.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get homeRetryButton;

  /// No description provided for @homeNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get homeNotifications;

  /// No description provided for @homeAllClasses.
  ///
  /// In en, this message translates to:
  /// **'All classes'**
  String get homeAllClasses;

  /// No description provided for @homeAllLessons.
  ///
  /// In en, this message translates to:
  /// **'All lessons'**
  String get homeAllLessons;

  /// No description provided for @homeLessonStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get homeLessonStatusCompleted;

  /// No description provided for @homeLessonStatusNow.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get homeLessonStatusNow;

  /// No description provided for @homeLessonStatusUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get homeLessonStatusUpcoming;

  /// No description provided for @commonLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get commonLoading;

  /// No description provided for @commonError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get commonError;

  /// No description provided for @commonLoadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load'**
  String get commonLoadError;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;

  /// No description provided for @commonPageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Page not found: {error}'**
  String commonPageNotFound(Object error);

  /// No description provided for @commonInvalidOtpRequest.
  ///
  /// In en, this message translates to:
  /// **'Invalid OTP request'**
  String get commonInvalidOtpRequest;

  /// No description provided for @comingSoonWithTitle.
  ///
  /// In en, this message translates to:
  /// **'{title} (coming soon)'**
  String comingSoonWithTitle(Object title);

  /// No description provided for @mainNavHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get mainNavHome;

  /// No description provided for @mainNavJournal.
  ///
  /// In en, this message translates to:
  /// **'Journal'**
  String get mainNavJournal;

  /// No description provided for @mainNavChats.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get mainNavChats;

  /// No description provided for @mainNavProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get mainNavProfile;

  /// No description provided for @journalTitle.
  ///
  /// In en, this message translates to:
  /// **'Journal'**
  String get journalTitle;

  /// No description provided for @chatTitle.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get chatTitle;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileMenuSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileMenuSettings;

  /// No description provided for @profileMenuTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get profileMenuTerms;

  /// No description provided for @profileMenuSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get profileMenuSupport;

  /// No description provided for @profileSupportTelegram.
  ///
  /// In en, this message translates to:
  /// **'Write via Telegram'**
  String get profileSupportTelegram;

  /// No description provided for @profileMenuLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profileMenuLogout;

  /// No description provided for @profileLogoutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get profileLogoutConfirmTitle;

  /// No description provided for @profilePersonalDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal data'**
  String get profilePersonalDataTitle;

  /// No description provided for @profilePersonalDataIdLabel.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get profilePersonalDataIdLabel;

  /// No description provided for @profilePersonalDataDobLabel.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get profilePersonalDataDobLabel;

  /// No description provided for @profilePersonalDataGenderLabel.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get profilePersonalDataGenderLabel;

  /// No description provided for @profilePersonalDataPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Contact phone number'**
  String get profilePersonalDataPhoneLabel;

  /// No description provided for @profilePersonalDataAddressLabel.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get profilePersonalDataAddressLabel;

  /// No description provided for @profilePersonalDataPassportLabel.
  ///
  /// In en, this message translates to:
  /// **'Passport series and number'**
  String get profilePersonalDataPassportLabel;

  /// No description provided for @profileAvatarSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Avatar'**
  String get profileAvatarSheetTitle;

  /// No description provided for @profileAvatarSheetGallery.
  ///
  /// In en, this message translates to:
  /// **'Upload from gallery'**
  String get profileAvatarSheetGallery;

  /// No description provided for @profileAvatarSheetCamera.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get profileAvatarSheetCamera;

  /// No description provided for @profileAvatarSheetSetPhoto.
  ///
  /// In en, this message translates to:
  /// **'Set photo'**
  String get profileAvatarSheetSetPhoto;

  /// No description provided for @profileAvatarSheetDeletePhoto.
  ///
  /// In en, this message translates to:
  /// **'Delete photo'**
  String get profileAvatarSheetDeletePhoto;

  /// No description provided for @settingsLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguageTitle;

  /// No description provided for @commonNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get commonNo;

  /// No description provided for @commonYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get commonYes;

  /// No description provided for @cardAddTitle.
  ///
  /// In en, this message translates to:
  /// **'Add card'**
  String get cardAddTitle;

  /// No description provided for @cardNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Card number'**
  String get cardNumberLabel;

  /// No description provided for @cardNumberHint.
  ///
  /// In en, this message translates to:
  /// **'0000 0000 0000 0000'**
  String get cardNumberHint;

  /// No description provided for @cardNumberError.
  ///
  /// In en, this message translates to:
  /// **'Enter all 16 digits of the card'**
  String get cardNumberError;

  /// No description provided for @cardExpiryLabel.
  ///
  /// In en, this message translates to:
  /// **'Expiry date'**
  String get cardExpiryLabel;

  /// No description provided for @cardExpiryHint.
  ///
  /// In en, this message translates to:
  /// **'MM/YY'**
  String get cardExpiryHint;

  /// No description provided for @cardExpiryError.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid expiry date'**
  String get cardExpiryError;

  /// No description provided for @cardPreviewValidThru.
  ///
  /// In en, this message translates to:
  /// **'VALID THRU'**
  String get cardPreviewValidThru;

  /// No description provided for @cardScanButton.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get cardScanButton;

  /// No description provided for @cardNfcButton.
  ///
  /// In en, this message translates to:
  /// **'NFC'**
  String get cardNfcButton;

  /// No description provided for @cardSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Add card'**
  String get cardSaveButton;

  /// No description provided for @commonOr.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get commonOr;

  /// No description provided for @cardScannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Card scanning'**
  String get cardScannerTitle;

  /// No description provided for @cardScannerHint.
  ///
  /// In en, this message translates to:
  /// **'Place the card inside the frame'**
  String get cardScannerHint;

  /// No description provided for @cardScannerRecognizedHint.
  ///
  /// In en, this message translates to:
  /// **'Card recognized'**
  String get cardScannerRecognizedHint;

  /// No description provided for @cardScannerManualInput.
  ///
  /// In en, this message translates to:
  /// **'Enter manually'**
  String get cardScannerManualInput;

  /// No description provided for @cardScannerUseResult.
  ///
  /// In en, this message translates to:
  /// **'Use data'**
  String get cardScannerUseResult;

  /// No description provided for @cardScannerPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Camera access needed'**
  String get cardScannerPermissionTitle;

  /// No description provided for @cardScannerPermissionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Allow camera access to scan the card details.'**
  String get cardScannerPermissionSubtitle;

  /// No description provided for @cardScannerPermissionSettingsHint.
  ///
  /// In en, this message translates to:
  /// **'Camera access is turned off. Enable it in the system settings to scan the card.'**
  String get cardScannerPermissionSettingsHint;

  /// No description provided for @cardScannerPermissionAllow.
  ///
  /// In en, this message translates to:
  /// **'Allow access'**
  String get cardScannerPermissionAllow;

  /// No description provided for @cardScannerPermissionOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get cardScannerPermissionOpenSettings;

  /// No description provided for @cardNfcDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Tap your card'**
  String get cardNfcDialogTitle;

  /// No description provided for @cardNfcDialogSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Hold the card against the back of the phone until reading is finished'**
  String get cardNfcDialogSubtitle;

  /// No description provided for @cardNfcDialogSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Card read'**
  String get cardNfcDialogSuccessTitle;

  /// No description provided for @cardNfcDialogSuccessSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The card details are filled in the form'**
  String get cardNfcDialogSuccessSubtitle;

  /// No description provided for @cardNfcDialogErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Could not read the card'**
  String get cardNfcDialogErrorTitle;

  /// No description provided for @cardNfcDialogErrorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Move the card away and try again'**
  String get cardNfcDialogErrorSubtitle;

  /// No description provided for @cardNfcDialogRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get cardNfcDialogRetry;

  /// No description provided for @cardNfcDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cardNfcDialogCancel;

  /// No description provided for @cardNfcDialogClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get cardNfcDialogClose;

  /// No description provided for @cardAddSuccess.
  ///
  /// In en, this message translates to:
  /// **'Card added'**
  String get cardAddSuccess;

  /// No description provided for @cardDuplicateError.
  ///
  /// In en, this message translates to:
  /// **'This card has already been added'**
  String get cardDuplicateError;

  /// No description provided for @cardAddError.
  ///
  /// In en, this message translates to:
  /// **'Could not add the card. Try again.'**
  String get cardAddError;

  /// No description provided for @cardsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'My cards'**
  String get cardsSectionTitle;

  /// No description provided for @cardsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No cards yet'**
  String get cardsEmptyTitle;

  /// No description provided for @cardsEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add your first card and it will show up here.'**
  String get cardsEmptySubtitle;

  /// No description provided for @cardsLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load the saved cards.'**
  String get cardsLoadError;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
