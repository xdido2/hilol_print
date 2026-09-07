import 'package:flutter/material.dart';

import '../../../../common/extensions/extensions.dart';
import 'card_preview_widget.dart' show kCardAspectRatio;

const double _kFrameRadius = 20;
const double _kFrameMargin = 20;
const double _kCornerLength = 26;

/// {@template scanner_overlay_widget}
/// Dims the camera preview everywhere but the card-shaped window, draws the
/// corner brackets and animates the scanning line inside the window.
/// {@endtemplate}
final class ScannerOverlayWidget extends StatelessWidget {
  /// {@macro scanner_overlay_widget}
  const ScannerOverlayWidget({
    super.key,
    required this.scanAnimation,
    required this.hintText,
    required this.frameColor,
    required this.scanLineColor,
  });

  final Animation<double> scanAnimation;
  final String hintText;
  final Color frameColor;
  final Color scanLineColor;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final width = constraints.maxWidth - _kFrameMargin * 2;
      final height = width / kCardAspectRatio;
      final top = ((constraints.maxHeight - height) / 2 - 48).clamp(kToolbarHeight + 40, constraints.maxHeight);
      final Rect frame = .fromLTWH(_kFrameMargin, top.toDouble(), width, height);

      return Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _ScannerOverlayPainter(
                frame: frame,
                dimColor: context.color.black.withValues(alpha: 0.62),
                frameColor: frameColor,
                scanLineColor: scanLineColor,
                animation: scanAnimation,
              ),
            ),
          ),
          Positioned(
            top: frame.bottom + 28,
            left: 32,
            right: 32,
            child: Text(
              hintText,
              textAlign: .center,
              style: context.textTheme.interW500s16.copyWith(color: context.color.white),
            ),
          ),
        ],
      );
    },
  );
}

class _ScannerOverlayPainter extends CustomPainter {
  _ScannerOverlayPainter({
    required this.frame,
    required this.dimColor,
    required this.frameColor,
    required this.scanLineColor,
    required this.animation,
  }) : super(repaint: animation);

  final Rect frame;
  final Color dimColor;
  final Color frameColor;
  final Color scanLineColor;
  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final RRect window = .fromRectAndRadius(frame, const .circular(_kFrameRadius));

    canvas.drawPath(
      .combine(.difference, Path()..addRect(Offset.zero & size), Path()..addRRect(window)),
      Paint()..color = dimColor,
    );

    canvas
      ..drawRRect(
        window,
        Paint()
          ..color = frameColor.withValues(alpha: 0.35)
          ..style = .stroke
          ..strokeWidth = 1,
      )
      ..drawPath(
        _cornersPath(),
        Paint()
          ..color = frameColor
          ..style = .stroke
          ..strokeWidth = 4
          ..strokeCap = .round,
      );

    _paintScanLine(canvas, window);
  }

  void _paintScanLine(Canvas canvas, RRect window) {
    final lineY = frame.top + frame.height * animation.value;
    final Rect lineRect = .fromLTWH(frame.left, lineY - 1.5, frame.width, 3);
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [scanLineColor.withValues(alpha: 0), scanLineColor, scanLineColor.withValues(alpha: 0)],
      ).createShader(lineRect);

    canvas
      ..save()
      ..clipRRect(window)
      ..drawRect(lineRect, paint)
      ..restore();
  }

  Path _cornersPath() {
    const Radius radius = .circular(_kFrameRadius);
    const r = _kFrameRadius;
    const len = _kCornerLength;

    return Path()
      // Top left.
      ..moveTo(frame.left, frame.top + r + len)
      ..lineTo(frame.left, frame.top + r)
      ..arcToPoint(Offset(frame.left + r, frame.top), radius: radius)
      ..lineTo(frame.left + r + len, frame.top)
      // Top right.
      ..moveTo(frame.right - r - len, frame.top)
      ..lineTo(frame.right - r, frame.top)
      ..arcToPoint(Offset(frame.right, frame.top + r), radius: radius)
      ..lineTo(frame.right, frame.top + r + len)
      // Bottom right.
      ..moveTo(frame.right, frame.bottom - r - len)
      ..lineTo(frame.right, frame.bottom - r)
      ..arcToPoint(Offset(frame.right - r, frame.bottom), radius: radius)
      ..lineTo(frame.right - r - len, frame.bottom)
      // Bottom left.
      ..moveTo(frame.left + r + len, frame.bottom)
      ..lineTo(frame.left + r, frame.bottom)
      ..arcToPoint(Offset(frame.left, frame.bottom - r), radius: radius)
      ..lineTo(frame.left, frame.bottom - r - len);
  }

  @override
  bool shouldRepaint(covariant _ScannerOverlayPainter oldDelegate) =>
      frame != oldDelegate.frame ||
      dimColor != oldDelegate.dimColor ||
      frameColor != oldDelegate.frameColor ||
      scanLineColor != oldDelegate.scanLineColor;
}
