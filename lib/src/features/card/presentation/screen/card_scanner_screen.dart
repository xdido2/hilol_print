import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../../core/widget/button/custom_button.dart';
import '../cubit/card_scanner_cubit.dart';
import '../cubit/card_scanner_cubit_state.dart';
import '../state/card_scanner_state.dart';
import '../widget/scanner_camera_preview_widget.dart';
import '../widget/scanner_overlay_widget.dart';
import '../widget/scanner_permission_widget.dart';
import '../widget/scanner_result_widget.dart';

/// {@template card_scanner_screen}
/// Full-screen camera scanner: the card is aligned inside the frame and its
/// PAN and expiry date are read from the live preview.
/// {@endtemplate}
class CardScannerScreen extends StatefulWidget {
  /// {@macro card_scanner_screen}
  const CardScannerScreen({super.key});

  @override
  State<CardScannerScreen> createState() => _CardScannerScreenState();
}

class _CardScannerScreenState extends CardScannerState {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.color.black,
    body: BlocConsumer<CardScannerCubit, CardScannerCubitState>(
      listenWhen: (previous, current) => previous.isRecognized != current.isRecognized,
      listener: (_, state) => onScanStateChanged(state),
      builder: (context, state) => Stack(
        children: [
          Positioned.fill(child: _Background(state: state)),
          if (!state.isPermissionDenied)
            Positioned.fill(
              child: ScannerOverlayWidget(
                scanAnimation: scanAnimation,
                hintText: state.isRecognized ? context.l10n.cardScannerRecognizedHint : context.l10n.cardScannerHint,
                frameColor: state.isRecognized ? context.color.success : context.color.white,
                scanLineColor: context.color.primary,
              ),
            ),
          SafeArea(
            child: Padding(
              padding: const .fromLTRB(16, 8, 16, 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      _ScannerCircleButton(icon: Icons.close_rounded, onTap: onCloseTap),
                      Expanded(
                        child: Text(
                          context.l10n.cardScannerTitle,
                          textAlign: .center,
                          style: context.textTheme.sfProDisplayW700s18.copyWith(color: context.color.white),
                        ),
                      ),
                      _ScannerCircleButton(
                        icon: state.isTorchEnabled ? Icons.flash_on_rounded : Icons.flash_off_rounded,
                        isActive: state.isTorchEnabled,
                        isEnabled: state.isCameraReady,
                        onTap: onTorchTap,
                      ),
                    ],
                  ),
                  const Spacer(),
                  // The permission notice is centred; the scanning controls
                  // stay pinned to the bottom edge.
                  if (state.isPermissionDenied) ...[
                    ScannerPermissionWidget(
                      isPermanentlyDenied: state.isPermissionPermanentlyDenied,
                      onSettingsTap: onOpenSettingsTap,
                      onRetryTap: onRetryTap,
                    ),
                    const Spacer(),
                  ] else ...[
                    ScannerResultWidget(
                      cardNumber: state.scan.panNumber?.formattedCardNumber,
                      expiry: state.scan.expiry?.formattedCardExpiry,
                    ),
                    const SizedBox(height: 12),
                    if (state.isRecognized)
                      CustomButton(title: context.l10n.cardScannerUseResult, onTap: () => onConfirmTap(state))
                    else
                      CustomButton(
                        title: context.l10n.cardScannerManualInput,
                        backgroundColor: context.color.white.withValues(alpha: 0.16),
                        titleColor: context.color.white,
                        onTap: onCloseTap,
                      ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

/// Whatever sits behind the overlay: the live preview once the camera is up,
/// a neutral placeholder while it starts, nothing while access is missing.
final class _Background extends StatelessWidget {
  const _Background({required this.state});

  final CardScannerCubitState state;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CardScannerCubit>().cameraController;

    if (state.isCameraReady && controller != null) return ScannerCameraPreviewWidget(controller: controller);

    return _CameraPlaceholder(isFailed: state.status.isError && !state.isPermissionDenied);
  }
}

final class _ScannerCircleButton extends StatelessWidget {
  const _ScannerCircleButton({required this.icon, required this.onTap, this.isActive = false, this.isEnabled = true});

  final IconData icon;
  final VoidCallback onTap;
  final bool isActive;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return InkWell(
      onTap: isEnabled ? onTap : null,
      customBorder: const CircleBorder(),
      child: Ink(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: .circle,
          color: isActive ? colors.white : colors.white.withValues(alpha: 0.16),
        ),
        child: Icon(
          icon,
          size: 22,
          color: isActive ? colors.grey950 : colors.white.withValues(alpha: isEnabled ? 1 : 0.4),
        ),
      ),
    );
  }
}

final class _CameraPlaceholder extends StatelessWidget {
  const _CameraPlaceholder({required this.isFailed});

  final bool isFailed;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: .topCenter,
          end: .bottomCenter,
          colors: [Color.lerp(colors.grey950, colors.white, 0.12)!, colors.black],
        ),
      ),
      child: Center(
        child: isFailed
            ? Icon(Icons.videocam_off_outlined, size: 64, color: colors.white.withValues(alpha: 0.2))
            : CircularProgressIndicator(color: colors.white.withValues(alpha: 0.4), strokeWidth: 2),
      ),
    );
  }
}
