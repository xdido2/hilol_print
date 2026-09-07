import 'package:flutter/material.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../../core/widget/button/custom_button.dart';

/// {@template scanner_permission_widget}
/// Shown instead of the preview when camera access is missing: offers the
/// system settings after a permanent denial and a retry otherwise.
/// {@endtemplate}
final class ScannerPermissionWidget extends StatelessWidget {
  /// {@macro scanner_permission_widget}
  const ScannerPermissionWidget({
    super.key,
    required this.isPermanentlyDenied,
    required this.onSettingsTap,
    required this.onRetryTap,
  });

  final bool isPermanentlyDenied;
  final VoidCallback onSettingsTap;
  final VoidCallback onRetryTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final l10n = context.l10n;

    return Padding(
      padding: const .symmetric(horizontal: 32),
      child: Column(
        mainAxisSize: .min,
        mainAxisAlignment: .center,
        children: [
          Icon(Icons.no_photography_outlined, size: 56, color: colors.white.withValues(alpha: 0.5)),
          const SizedBox(height: 20),
          Text(
            l10n.cardScannerPermissionTitle,
            textAlign: .center,
            style: context.textTheme.sfProDisplayW700s18.copyWith(color: colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            isPermanentlyDenied ? l10n.cardScannerPermissionSettingsHint : l10n.cardScannerPermissionSubtitle,
            textAlign: .center,
            style: context.textTheme.interW400s14.copyWith(color: colors.white.withValues(alpha: 0.65)),
          ),
          const SizedBox(height: 24),
          CustomButton(
            title: isPermanentlyDenied ? l10n.cardScannerPermissionOpenSettings : l10n.cardScannerPermissionAllow,
            onTap: isPermanentlyDenied ? onSettingsTap : onRetryTap,
          ),
        ],
      ),
    );
  }
}
