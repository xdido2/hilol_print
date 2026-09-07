import 'dart:ui' show Size;

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../domain/entity/camera_frame_entity.dart';
import '../../models/recognized_text_model.dart';

abstract interface class CardScannerDataSource {
  Future<PermissionStatus> requestCameraPermission();

  Future<RecognizedTextModel> recognizeText(CameraFrameEntity frame);

  Future<bool> openSettings();

  Future<void> dispose();
}

final class CardScannerDataSourceImpl implements CardScannerDataSource {
  CardScannerDataSourceImpl({TextRecognizer Function()? textRecognizerFactory})
    : _textRecognizerFactory = textRecognizerFactory ?? _latinTextRecognizer;

  static TextRecognizer _latinTextRecognizer() => TextRecognizer(script: .latin);

  final TextRecognizer Function() _textRecognizerFactory;

  /// Built on first use and dropped on [dispose] so the native recognizer is
  /// not held between scans — and so a second scan can start a fresh one.
  TextRecognizer? _textRecognizer;

  TextRecognizer get _recognizer => _textRecognizer ??= _textRecognizerFactory();

  @override
  Future<PermissionStatus> requestCameraPermission() => Permission.camera.request();

  @override
  Future<RecognizedTextModel> recognizeText(CameraFrameEntity frame) async {
    final RecognizedText text = await _recognizer.processImage(_toInputImage(frame));
    return RecognizedTextModel.fromRecognizedText(text);
  }

  @override
  Future<bool> openSettings() => openAppSettings();

  @override
  Future<void> dispose() async {
    final recognizer = _textRecognizer;
    _textRecognizer = null;
    await recognizer?.close();
  }

  InputImage _toInputImage(CameraFrameEntity frame) => InputImage.fromBytes(
    bytes: frame.bytes,
    metadata: InputImageMetadata(
      size: Size(frame.width.toDouble(), frame.height.toDouble()),
      rotation: InputImageRotationValue.fromRawValue(frame.rotationDegrees) ?? InputImageRotation.rotation0deg,
      format: _toInputImageFormat(frame.format),
      bytesPerRow: frame.bytesPerRow,
    ),
  );

  InputImageFormat _toInputImageFormat(CameraFrameFormat format) => switch (format) {
    .nv21 => .nv21,
    .yuv420 => .yuv420,
    .bgra8888 => .bgra8888,
    // The stream is configured with an explicit group, so this is unreachable
    // in practice; nv21 keeps the call well-formed instead of throwing.
    .unknown => .nv21,
  };
}
