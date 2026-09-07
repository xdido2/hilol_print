import 'package:flutter/services.dart';

import '../../../../common/extensions/extensions.dart';

/// {@template card_number_input_formatter}
/// Formats a raw PAN into `0000 0000 0000 0000` groups while the user types.
/// {@endtemplate}
final class CardNumberInputFormatter extends TextInputFormatter {
  /// {@macro card_number_input_formatter}
  const CardNumberInputFormatter({this.maxDigits = panLength, this.groupSize = 4, this.separator = ' '});

  /// Digit count of a Humo / Uzcard PAN.
  static const int panLength = 16;

  final int maxDigits;
  final int groupSize;
  final String separator;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digits = newValue.text.onlyDigits;
    final trimmed = digits.length > maxDigits ? digits.substring(0, maxDigits) : digits;
    final buffer = StringBuffer();

    for (var i = 0; i < trimmed.length; i++) {
      if (i != 0 && i % groupSize == 0) buffer.write(separator);
      buffer.write(trimmed[i]);
    }

    final text = buffer.toString();
    return TextEditingValue(
      text: text,
      selection: .collapsed(offset: text.length),
    );
  }
}
