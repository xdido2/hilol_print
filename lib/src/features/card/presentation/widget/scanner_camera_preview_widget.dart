import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

/// {@template scanner_camera_preview_widget}
/// Fills the screen with the camera preview, cropping the overflow instead of
/// letter-boxing it — the overlay frame is drawn against a full-bleed image.
/// {@endtemplate}
final class ScannerCameraPreviewWidget extends StatelessWidget {
  /// {@macro scanner_camera_preview_widget}
  const ScannerCameraPreviewWidget({super.key, required this.controller});

  final CameraController controller;

  @override
  Widget build(BuildContext context) {
    // `previewSize` is reported in sensor orientation, so the axes are swapped
    // to describe the portrait preview the screen is locked to.
    final Size? previewSize = controller.value.previewSize;
    if (previewSize == null) return const SizedBox.shrink();

    return FittedBox(
      fit: .cover,
      child: SizedBox(width: previewSize.height, height: previewSize.width, child: CameraPreview(controller)),
    );
  }
}
