/// Rules that define what counts as a readable Uzbek bank card.
///
/// Shared by the OCR parser and the NFC reader so a card accepted by one is
/// accepted by the other: `RecognizeCardUseCase` used to own these constants
/// privately, which meant the two paths could silently drift apart.
abstract final class CardRules {
  /// Digit count of a Humo / Uzcard PAN.
  static const int panLength = 16;

  /// BINs of the local schemes. Their PANs do not always satisfy the Luhn
  /// checksum, so a candidate carrying one of these is accepted without it.
  static const Set<String> localBins = <String>{'8600', '9860'};

  /// A printed expiry no further ahead than this is considered plausible.
  static const int maxYearsAhead = 20;

  /// An already expired card still has to be readable, just not an arbitrarily
  /// old four-digit group that happens to look like a date.
  static const int maxYearsBehind = 10;

  /// Accepts a Luhn-valid PAN, or one carrying a local-scheme BIN.
  static bool isAcceptablePan(String digits) {
    if (digits.length != panLength) return false;

    return isLuhnValid(digits) || localBins.contains(digits.substring(0, 4));
  }

  static bool isLuhnValid(String digits) {
    var sum = 0;
    var isSecond = false;

    for (var i = digits.length - 1; i >= 0; i--) {
      var value = digits.codeUnitAt(i) - 0x30;
      if (value < 0 || value > 9) return false;
      if (isSecond) {
        value *= 2;
        if (value > 9) value -= 9;
      }
      sum += value;
      isSecond = !isSecond;
    }

    return sum % 10 == 0;
  }

  static bool isPlausibleExpiry({required int month, required int fullYear, required DateTime now}) {
    if (month < 1 || month > 12) return false;

    return fullYear >= now.year - maxYearsBehind && fullYear <= now.year + maxYearsAhead;
  }
}
