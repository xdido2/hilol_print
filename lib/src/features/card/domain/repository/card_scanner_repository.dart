import '../entity/camera_frame_entity.dart';
import '../entity/camera_permission_status.dart';
import '../entity/recognized_text_entity.dart';

abstract interface class CardScannerRepository {
  /// Asks for camera access, returning the resulting authorization.
  Future<CameraPermissionStatus> requestCameraPermission();

  /// Reads the text of a single camera frame.
  Future<RecognizedTextEntity> recognizeText(CameraFrameEntity frame);

  /// Opens the system settings page of the app.
  Future<void> openAppSettings();

  /// Releases the recognizer. Safe to call more than once.
  Future<void> dispose();
}
