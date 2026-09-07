import 'dart:typed_data';

/// Pixel layout of a [CameraFrameEntity] buffer.
///
/// Mirrors the subset of camera formats the recognizer accepts: `nv21` on
/// Android, `bgra8888` on iOS.
enum CameraFrameFormat { nv21, yuv420, bgra8888, unknown }

/// A single camera frame handed to the recognizer.
///
/// Kept free of any plugin type so the domain stays pure Dart: the
/// presentation layer maps the platform frame onto this entity and the data
/// layer maps it onto the ML SDK input.
final class CameraFrameEntity {
  const CameraFrameEntity({
    required this.bytes,
    required this.width,
    required this.height,
    required this.bytesPerRow,
    required this.format,
    required this.rotationDegrees,
  });

  /// Raw bytes of the first plane, already in [format].
  final Uint8List bytes;

  final int width;
  final int height;

  /// Row stride of the first plane, in bytes. Ignored on Android.
  final int bytesPerRow;

  final CameraFrameFormat format;

  /// Clockwise rotation the recognizer has to apply. Ignored on iOS.
  final int rotationDegrees;
}
