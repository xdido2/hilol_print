import 'package:flutter/services.dart';

import '../../../../common/extensions/extensions.dart';

/// {@template card_expiry_input_formatter}
/// Formats an expiry date into `MM/YY` and keeps the month inside `01..12`.
/// {@endtemplate}
final class CardExpiryInputFormatter extends TextInputFormatter {
  /// {@macro card_expiry_input_formatter}
  const CardExpiryInputFormatter({this.separator = '/'});

  /// Character count of a formatted `MM/YY` value.
  static const int expiryLength = 5;

  final String separator;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digits = newValue.text.onlyDigits;
    var normalized = digits.length > 4 ? digits.substring(0, 4) : digits;

    // A single digit above `1` can only start a zero-padded month: `3` -> `03`.
    if (normalized.length == 1 && int.parse(normalized) > 1) normalized = '0$normalized';

    if (normalized.length >= 2) {
      final int month = .parse(normalized.substring(0, 2));
      final year = normalized.substring(2);
      if (month == 0) {
        normalized = '01$year';
      } else if (month > 12) {
        normalized = '12$year';
      }
    }

    final text = normalized.length <= 2
        ? normalized
        : '${normalized.substring(0, 2)}$separator${normalized.substring(2)}';

    return TextEditingValue(
      text: text,
      selection: .collapsed(offset: text.length),
    );
  }
}
