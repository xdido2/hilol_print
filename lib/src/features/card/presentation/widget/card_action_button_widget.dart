import 'package:flutter/material.dart';

import '../../../../common/extensions/extensions.dart';

/// {@template card_action_button_widget}
/// Secondary action of the add-card form — camera scan or NFC read.
/// {@endtemplate}
final class CardActionButtonWidget extends StatelessWidget {
  /// {@macro card_action_button_widget}
  const CardActionButtonWidget({super.key, required this.icon, required this.title, required this.onTap});

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: context.color.transparent,
    child: InkWell(
      onTap: onTap,
      borderRadius: .circular(56),
      child: Ink(
        height: 52,
        decoration: BoxDecoration(color: context.color.grey60, borderRadius: .circular(56)),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Icon(icon, size: 20, color: context.color.primary),
            const SizedBox(width: 8),
            Flexible(
              child: Text(title, maxLines: 1, overflow: .ellipsis, style: context.textTheme.interW600s14),
            ),
          ],
        ),
      ),
    ),
  );
}
