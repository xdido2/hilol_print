import 'package:permission_handler/permission_handler.dart';

import '../../domain/entity/camera_frame_entity.dart';
import '../../domain/entity/camera_permission_status.dart';
import '../../domain/entity/recognized_text_entity.dart';
import '../../domain/error/card_exceptions.dart';
import '../../domain/repository/card_scanner_repository.dart';
import '../datasources/local/card_scanner_data_source.dart';

final class CardScannerRepositoryImpl implements CardScannerRepository {
  const CardScannerRepositoryImpl({required CardScannerDataSource dataSource}) : _dataSource = dataSource;

  final CardScannerDataSource _dataSource;

  @override
  Future<CameraPermissionStatus> requestCameraPermission() async {
    final PermissionStatus status = await _dataSource.requestCameraPermission();
    return _toDomainStatus(status);
  }

  @override
  Future<RecognizedTextEntity> recognizeText(CameraFrameEntity frame) async {
    try {
      final model = await _dataSource.recognizeText(frame);
      return model.toEntity();
    } on Exception {
      throw const TextRecognitionException();
    }
  }

  @override
  Future<void> openAppSettings() => _dataSource.openSettings();

  @override
  Future<void> dispose() => _dataSource.dispose();

  /// `limited` and `provisional` never apply to the camera, but they read as
  /// usable access on the platforms that do report them.
  CameraPermissionStatus _toDomainStatus(PermissionStatus status) => switch (status) {
    .granted || .limited || .provisional => .granted,
    .permanentlyDenied || .restricted => .permanentlyDenied,
    .denied => .denied,
  };
}
