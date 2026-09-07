// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(title) => "${title} (coming soon)";

  static String m1(error) => "Page not found: ${error}";

  static String m2(time) => "Resend in ${time}";

  static String m3(phone) => "Enter the code sent to ${phone}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "chatTitle": MessageLookupByLibrary.simpleMessage("Chats"),
    "comingSoonWithTitle": m0,
    "commonError": MessageLookupByLibrary.simpleMessage("Error"),
    "commonInvalidOtpRequest": MessageLookupByLibrary.simpleMessage("Invalid OTP request"),
    "commonLoadError": MessageLookupByLibrary.simpleMessage("Failed to load"),
    "commonLoading": MessageLookupByLibrary.simpleMessage("Loading"),
    "commonNo": MessageLookupByLibrary.simpleMessage("No"),
    "commonPageNotFound": m1,
    "commonRetry": MessageLookupByLibrary.simpleMessage("Retry"),
    "commonYes": MessageLookupByLibrary.simpleMessage("Yes"),
    "homeAllButton": MessageLookupByLibrary.simpleMessage("All"),
    "homeAllClasses": MessageLookupByLibrary.simpleMessage("All classes"),
    "homeAllLessons": MessageLookupByLibrary.simpleMessage("All lessons"),
    "homeLessonStatusCompleted": MessageLookupByLibrary.simpleMessage("Completed"),
    "homeLessonStatusNow": MessageLookupByLibrary.simpleMessage("Now"),
    "homeLessonStatusUpcoming": MessageLookupByLibrary.simpleMessage("Upcoming"),
    "homeLoadError": MessageLookupByLibrary.simpleMessage("Failed to load"),
    "homeMyClassesSectionTitle": MessageLookupByLibrary.simpleMessage("My classes"),
    "homeNotifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "homeRetryButton": MessageLookupByLibrary.simpleMessage("Retry"),
    "homeTitle": MessageLookupByLibrary.simpleMessage("Home"),
    "homeTodayLessonsSectionTitle": MessageLookupByLibrary.simpleMessage("Lessons today"),
    "journalTitle": MessageLookupByLibrary.simpleMessage("Journal"),
    "loginAgreementMiddle": MessageLookupByLibrary.simpleMessage(" and "),
    "loginAgreementPrefix": MessageLookupByLibrary.simpleMessage("By continuing, you agree to the "),
    "loginAgreementPrivacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "loginAgreementSuffix": MessageLookupByLibrary.simpleMessage("."),
    "loginAgreementTerms": MessageLookupByLibrary.simpleMessage("Terms of Service"),
    "loginContinueButton": MessageLookupByLibrary.simpleMessage("Continue"),
    "loginLanguageEnglish": MessageLookupByLibrary.simpleMessage("English"),
    "loginLanguageRussian": MessageLookupByLibrary.simpleMessage("Русский"),
    "loginLanguageSheetSelectButton": MessageLookupByLibrary.simpleMessage("Select"),
    "loginLanguageSheetTitle": MessageLookupByLibrary.simpleMessage("Choose language"),
    "loginLanguageUzbek": MessageLookupByLibrary.simpleMessage("O‘zbekcha"),
    "loginPhoneHint": MessageLookupByLibrary.simpleMessage("99 123 45 67"),
    "loginPhoneLabel": MessageLookupByLibrary.simpleMessage("Phone number"),
    "loginPhoneNotFoundError": MessageLookupByLibrary.simpleMessage("Phone number not found"),
    "loginPhonePrefix": MessageLookupByLibrary.simpleMessage("+998"),
    "loginRegistrationSubtitle": MessageLookupByLibrary.simpleMessage("Enter your phone number to continue"),
    "loginRegistrationTitle": MessageLookupByLibrary.simpleMessage("Sign in"),
    "mainNavChats": MessageLookupByLibrary.simpleMessage("Chats"),
    "mainNavHome": MessageLookupByLibrary.simpleMessage("Home"),
    "mainNavJournal": MessageLookupByLibrary.simpleMessage("Journal"),
    "mainNavProfile": MessageLookupByLibrary.simpleMessage("Profile"),
    "otpConfirmButton": MessageLookupByLibrary.simpleMessage("Confirm"),
    "otpGenericError": MessageLookupByLibrary.simpleMessage("Something went wrong. Try again."),
    "otpResendSms": MessageLookupByLibrary.simpleMessage("Resend SMS"),
    "otpResendSmsIn": m2,
    "otpSmsResent": MessageLookupByLibrary.simpleMessage("SMS code resent"),
    "otpSubtitle": m3,
    "otpTitle": MessageLookupByLibrary.simpleMessage("Verification"),
    "profileAvatarSheetCamera": MessageLookupByLibrary.simpleMessage("Take a photo"),
    "profileAvatarSheetDeletePhoto": MessageLookupByLibrary.simpleMessage("Delete photo"),
    "profileAvatarSheetGallery": MessageLookupByLibrary.simpleMessage("Upload from gallery"),
    "profileAvatarSheetSetPhoto": MessageLookupByLibrary.simpleMessage("Set photo"),
    "profileAvatarSheetTitle": MessageLookupByLibrary.simpleMessage("Avatar"),
    "profileLogoutConfirmTitle": MessageLookupByLibrary.simpleMessage("Are you sure you want to log out?"),
    "profileMenuLogout": MessageLookupByLibrary.simpleMessage("Logout"),
    "profileMenuSettings": MessageLookupByLibrary.simpleMessage("Settings"),
    "profileMenuSupport": MessageLookupByLibrary.simpleMessage("Support"),
    "profileMenuTerms": MessageLookupByLibrary.simpleMessage("Terms of use"),
    "profilePersonalDataAddressLabel": MessageLookupByLibrary.simpleMessage("Address"),
    "profilePersonalDataDobLabel": MessageLookupByLibrary.simpleMessage("Date of birth"),
    "profilePersonalDataGenderLabel": MessageLookupByLibrary.simpleMessage("Gender"),
    "profilePersonalDataIdLabel": MessageLookupByLibrary.simpleMessage("ID"),
    "profilePersonalDataPassportLabel": MessageLookupByLibrary.simpleMessage("Passport series and number"),
    "profilePersonalDataPhoneLabel": MessageLookupByLibrary.simpleMessage("Contact phone number"),
    "profilePersonalDataTitle": MessageLookupByLibrary.simpleMessage("Personal data"),
    "profileSupportTelegram": MessageLookupByLibrary.simpleMessage("Write via Telegram"),
    "profileTitle": MessageLookupByLibrary.simpleMessage("Profile"),
    "settingsLanguageTitle": MessageLookupByLibrary.simpleMessage("Language"),
  };
}
