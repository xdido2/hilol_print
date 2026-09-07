import 'package:flutter/material.dart';

import '../../../../common/extensions/extensions.dart';
import '../../domain/entity/card_entity.dart';

/// {@template card_list_item_widget}
/// One saved card in a list: the PAN masked down to its last four digits and
/// the expiry date.
/// {@endtemplate}
final class CardListItemWidget extends StatelessWidget {
  /// {@macro card_list_item_widget}
  const CardListItemWidget({super.key, required this.card});

  final CardEntity card;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return Container(
      padding: const .all(14),
      decoration: BoxDecoration(color: colors.grey60, borderRadius: .circular(16)),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: .circular(8),
              gradient: LinearGradient(
                begin: .topLeft,
                end: .bottomRight,
                colors: [colors.primary, Color.lerp(colors.primary, colors.grey950, 0.55)!],
              ),
            ),
            child: Icon(Icons.credit_card_rounded, size: 18, color: colors.white),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(card.panNumber.maskedCardNumber, style: context.textTheme.interW600s16),
                const SizedBox(height: 4),
                Text(
                  '${context.l10n.cardPreviewValidThru} ${card.cardExpire.formattedCardExpiry}',
                  style: context.textTheme.interW400s12Grey500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
