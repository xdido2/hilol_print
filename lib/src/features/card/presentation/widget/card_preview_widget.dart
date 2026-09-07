import 'package:flutter/material.dart';

import '../../../../common/extensions/extensions.dart';
import '../formatter/card_number_input_formatter.dart';

/// Width / height ratio of an ID-1 bank card (ISO/IEC 7810).
const double kCardAspectRatio = 1.586;

const String _kPanPlaceholder = '•';
const String _kExpiryPlaceholder = 'MM/YY';

/// {@template card_preview_widget}
/// Live preview of the card being added: shows the PAN and the expiry date
/// exactly as they are typed, and the payment system once it is known.
/// {@endtemplate}
final class CardPreviewWidget extends StatelessWidget {
  /// {@macro card_preview_widget}
  const CardPreviewWidget({super.key, required this.cardNumber, required this.expiry, this.brandLabel});

  /// Raw or formatted PAN — everything but digits is ignored.
  final String cardNumber;

  /// Expiry date in `MM/YY`.
  final String expiry;

  /// Payment system name, e.g. `HUMO` or `UZCARD`. Hidden while `null`.
  final String? brandLabel;

  String get _maskedNumber {
    final digits = cardNumber.onlyDigits;
    final buffer = StringBuffer();

    for (var i = 0; i < CardNumberInputFormatter.panLength; i++) {
      if (i != 0 && i % 4 == 0) buffer.write('   ');
      buffer.write(i < digits.length ? digits[i] : _kPanPlaceholder);
    }

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final onCardColor = colors.white;

    return AspectRatio(
      aspectRatio: kCardAspectRatio,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: .circular(24),
          gradient: LinearGradient(
            begin: .topLeft,
            end: .bottomRight,
            colors: [colors.primary, Color.lerp(colors.primary, colors.grey950, 0.55)!],
          ),
          boxShadow: [
            BoxShadow(color: colors.primary.withValues(alpha: 0.25), blurRadius: 24, offset: const Offset(0, 12)),
          ],
        ),
        child: ClipRRect(
          borderRadius: .circular(24),
          child: Stack(
            children: [
              Positioned(top: -70, right: -40, child: _GlowCircle(size: 180, color: onCardColor)),
              Positioned(bottom: -90, left: -50, child: _GlowCircle(size: 200, color: onCardColor)),
              Padding(
                padding: const .all(20),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      children: [
                        const _CardChip(),
                        const Spacer(),
                        if (brandLabel case final String label)
                          Container(
                            padding: const .symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: onCardColor.withValues(alpha: 0.18),
                              borderRadius: .circular(8),
                            ),
                            child: Text(
                              label.toUpperCase(),
                              style: context.textTheme.interW600s12.copyWith(color: onCardColor, letterSpacing: 1),
                            ),
                          ),
                      ],
                    ),
                    const Spacer(),
                    FittedBox(
                      child: Text(
                        _maskedNumber,
                        style: context.textTheme.sfProDisplayW700s20.copyWith(color: onCardColor, letterSpacing: 1.4),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      context.l10n.cardPreviewValidThru,
                      style: context.textTheme.interW500s10.copyWith(
                        color: onCardColor.withValues(alpha: 0.6),
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      expiry.isEmpty ? _kExpiryPlaceholder : expiry,
                      style: context.textTheme.interW600s14.copyWith(color: onCardColor, letterSpacing: 1.2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _GlowCircle extends StatelessWidget {
  const _GlowCircle({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(shape: .circle, color: color.withValues(alpha: 0.07)),
  );
}

final class _CardChip extends StatelessWidget {
  const _CardChip();

  @override
  Widget build(BuildContext context) => Container(
    width: 38,
    height: 28,
    padding: const .symmetric(horizontal: 6, vertical: 6),
    decoration: BoxDecoration(
      borderRadius: .circular(6),
      gradient: const LinearGradient(
        begin: .topLeft,
        end: .bottomRight,
        colors: [Color(0xFFF6D68B), Color(0xFFD5A33C)],
      ),
    ),
    child: Column(
      mainAxisAlignment: .spaceBetween,
      children: .generate(3, (_) => Container(height: 1, color: context.color.black.withValues(alpha: 0.18))),
    ),
  );
}
