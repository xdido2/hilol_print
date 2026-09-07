import 'package:flutter/material.dart';

import '../../../../common/data/enums/bloc_status_enum.dart';
import '../../../../common/extensions/extensions.dart';
import '../../../../core/widget/button/custom_button.dart';

/// {@template nfc_read_dialog_widget}
/// Asks the user to hold the card against the phone and reflects the reading
/// [Status] — waiting, success or failure.
/// {@endtemplate}
final class NfcReadDialogWidget extends StatefulWidget {
  /// {@macro nfc_read_dialog_widget}
  const NfcReadDialogWidget({super.key, this.status = Status.loading, this.errorMessage, this.onRetry, this.onClose});

  final Status status;
  final String? errorMessage;
  final VoidCallback? onRetry;
  final VoidCallback? onClose;

  /// Opens the dialog above [context].
  static Future<void> show(
    BuildContext context, {
    Status status = .loading,
    String? errorMessage,
    VoidCallback? onRetry,
  }) => context.showAppDialog<void>(
    barrierDismissible: false,
    builder: (_) => NfcReadDialogWidget(status: status, errorMessage: errorMessage, onRetry: onRetry),
  );

  @override
  State<NfcReadDialogWidget> createState() => _NfcReadDialogWidgetState();
}

class _NfcReadDialogWidgetState extends State<NfcReadDialogWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800))..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _onClose() {
    widget.onClose?.call();
    if (context.canPop) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final l10n = context.l10n;
    final isWaiting = widget.status.isInitial || widget.status.isLoading;

    final (String title, String subtitle, IconData icon, Color accent) = switch (widget.status) {
      .initial || .loading => (l10n.cardNfcDialogTitle, l10n.cardNfcDialogSubtitle, Icons.nfc_rounded, colors.primary),
      .success => (
        l10n.cardNfcDialogSuccessTitle,
        l10n.cardNfcDialogSuccessSubtitle,
        Icons.check_rounded,
        colors.success,
      ),
      .error => (
        l10n.cardNfcDialogErrorTitle,
        widget.errorMessage ?? l10n.cardNfcDialogErrorSubtitle,
        Icons.close_rounded,
        colors.error,
      ),
    };

    return Dialog(
      backgroundColor: colors.white,
      surfaceTintColor: colors.transparent,
      insetPadding: const .symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: .circular(28)),
      child: Padding(
        padding: const .fromLTRB(24, 28, 24, 24),
        child: Column(
          mainAxisSize: .min,
          children: [
            _NfcPulse(controller: _pulseController, icon: icon, accent: accent, isAnimating: isWaiting),
            const SizedBox(height: 24),
            Text(title, textAlign: .center, style: context.textTheme.sfProDisplayW700s18),
            const SizedBox(height: 8),
            Text(subtitle, textAlign: .center, style: context.textTheme.interW400s14Grey500),
            const SizedBox(height: 28),
            if (widget.status.isError && widget.onRetry != null) ...[
              CustomButton(title: l10n.cardNfcDialogRetry, onTap: widget.onRetry),
              const SizedBox(height: 8),
            ],
            CustomButton(
              title: widget.status.isSuccess ? l10n.cardNfcDialogClose : l10n.cardNfcDialogCancel,
              backgroundColor: colors.grey60,
              titleColor: colors.grey950,
              onTap: _onClose,
            ),
          ],
        ),
      ),
    );
  }
}

final class _NfcPulse extends StatelessWidget {
  const _NfcPulse({required this.controller, required this.icon, required this.accent, required this.isAnimating});

  static const int _ringCount = 3;
  static const double _size = 132;

  final AnimationController controller;
  final IconData icon;
  final Color accent;
  final bool isAnimating;

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: _size,
    child: Stack(
      alignment: .center,
      children: [
        if (isAnimating)
          AnimatedBuilder(
            animation: controller,
            builder: (_, _) => Stack(
              alignment: .center,
              children: .generate(_ringCount, (index) {
                final progress = (controller.value + index / _ringCount) % 1;
                return Opacity(
                  opacity: (1 - progress) * 0.28,
                  child: Container(
                    width: _size * (0.5 + progress * 0.5),
                    height: _size * (0.5 + progress * 0.5),
                    decoration: BoxDecoration(shape: .circle, color: accent),
                  ),
                );
              }),
            ),
          ),
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(shape: .circle, color: accent.withValues(alpha: 0.14)),
          child: Icon(icon, size: 34, color: accent),
        ),
      ],
    ),
  );
}
