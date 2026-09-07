import 'package:flutter/material.dart';

import '../../../../common/extensions/extensions.dart';

/// {@template scanner_result_widget}
/// Bottom panel of the scanner: mirrors what has already been recognized so
/// the user sees the progress before the sheet closes.
/// {@endtemplate}
final class ScannerResultWidget extends StatelessWidget {
  /// {@macro scanner_result_widget}
  const ScannerResultWidget({super.key, required this.cardNumber, required this.expiry});

  final String? cardNumber;
  final String? expiry;

  @override
  Widget build(BuildContext context) => Container(
    padding: const .symmetric(horizontal: 16, vertical: 14),
    decoration: BoxDecoration(
      color: context.color.white.withValues(alpha: 0.12),
      borderRadius: .circular(20),
      border: Border.all(color: context.color.white.withValues(alpha: 0.16)),
    ),
    child: Column(
      mainAxisSize: .min,
      children: [
        _ResultRow(label: context.l10n.cardNumberLabel, value: cardNumber),
        const SizedBox(height: 12),
        _ResultRow(label: context.l10n.cardExpiryLabel, value: expiry),
      ],
    ),
  );
}

final class _ResultRow extends StatelessWidget {
  const _ResultRow({required this.label, required this.value});

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final hasValue = value != null && value!.isNotBlank;

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: context.textTheme.interW400s14.copyWith(color: colors.white.withValues(alpha: 0.6)),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          hasValue ? value! : '—',
          style: context.textTheme.interW600s14.copyWith(
            color: hasValue ? colors.white : colors.white.withValues(alpha: 0.4),
            letterSpacing: 0.6,
          ),
        ),
        const SizedBox(width: 8),
        Icon(
          hasValue ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
          size: 18,
          color: hasValue ? colors.success : colors.white.withValues(alpha: 0.35),
        ),
      ],
    );
  }
}
