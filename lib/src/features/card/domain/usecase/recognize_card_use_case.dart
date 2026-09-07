import '../entity/camera_frame_entity.dart';
import '../entity/card_scan_entity.dart';
import '../entity/recognized_text_entity.dart';
import '../repository/card_scanner_repository.dart';

DateTime _systemNow() => .now();

/// Reads a single camera frame and pulls the PAN and the expiry date out of
/// the recognized text.
///
/// A frame rarely carries both fields legibly, so the result is partial by
/// design — the caller accumulates it with [CardScanEntity.mergeWith].
final class RecognizeCardUseCase {
  const RecognizeCardUseCase({
    required CardScannerRepository cardScannerRepository,
    DateTime Function() now = _systemNow,
  }) : _cardScannerRepository = cardScannerRepository,
       _now = now;

  /// Digit count of a Humo / Uzcard PAN.
  static const int panLength = 16;

  /// BINs of the local schemes. Their PANs do not always satisfy the Luhn
  /// checksum, so a candidate carrying one of these is accepted without it.
  static const Set<String> localBins = <String>{'8600', '9860'};

  /// A printed expiry no further ahead than this is considered plausible.
  static const int _maxYearsAhead = 20;

  /// An already expired card still has to be readable, just not an arbitrarily
  /// old four-digit group that happens to look like a date.
  static const int _maxYearsBehind = 10;

  /// Sixteen digits, optionally split into groups, not glued to other digits.
  static final RegExp _panPattern = RegExp(r'(?<!\d)(?:\d[ \-]{0,2}){16}(?!\d)');

  /// `MM/YY`, month constrained to `01..12`.
  static final RegExp _expiryPattern = RegExp(r'(?<!\d)(0[1-9]|1[0-2])\s*/\s*(\d{2})(?!\d)');

  static final RegExp _nonDigit = RegExp(r'[^\d]');

  final CardScannerRepository _cardScannerRepository;
  final DateTime Function() _now;

  Future<CardScanEntity> call(CameraFrameEntity frame) async {
    final RecognizedTextEntity text = await _cardScannerRepository.recognizeText(frame);
    if (text.isEmpty) return const CardScanEntity();

    return CardScanEntity(panNumber: _findPan(text.lines), expiry: _findExpiry(text.lines));
  }

  /// Prefers a Luhn-valid candidate and falls back to a local-scheme BIN.
  String? _findPan(List<String> lines) {
    final candidates = <String>[];

    for (final line in lines) {
      for (final match in _panPattern.allMatches(line)) {
        final digits = match.group(0)!.replaceAll(_nonDigit, '');
        if (digits.length == panLength) candidates.add(digits);
      }
    }

    for (final candidate in candidates) {
      if (_isLuhnValid(candidate)) return candidate;
    }
    for (final candidate in candidates) {
      if (localBins.contains(candidate.substring(0, 4))) return candidate;
    }

    return null;
  }

  /// Cards may print both the issue and the expiry date; the later one is the
  /// expiry, so the plausible candidates are ranked and the newest wins.
  String? _findExpiry(List<String> lines) {
    final int currentYear = _now().year;
    String? best;
    var bestRank = -1;

    for (final line in lines) {
      for (final match in _expiryPattern.allMatches(line)) {
        final month = match.group(1)!;
        final year = match.group(2)!;
        final fullYear = 2000 + int.parse(year);

        if (fullYear < currentYear - _maxYearsBehind || fullYear > currentYear + _maxYearsAhead) continue;

        final rank = fullYear * 100 + int.parse(month);
        if (rank > bestRank) {
          bestRank = rank;
          best = '$month$year';
        }
      }
    }

    return best;
  }

  bool _isLuhnValid(String digits) {
    var sum = 0;
    var isSecond = false;

    for (var i = digits.length - 1; i >= 0; i--) {
      var value = digits.codeUnitAt(i) - 0x30;
      if (isSecond) {
        value *= 2;
        if (value > 9) value -= 9;
      }
      sum += value;
      isSecond = !isSecond;
    }

    return sum % 10 == 0;
  }
}
