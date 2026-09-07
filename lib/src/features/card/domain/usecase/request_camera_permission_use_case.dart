import '../entity/camera_permission_status.dart';
import '../repository/card_scanner_repository.dart';

final class RequestCameraPermissionUseCase {
  const RequestCameraPermissionUseCase({required CardScannerRepository cardScannerRepository})
    : _cardScannerRepository = cardScannerRepository;

  final CardScannerRepository _cardScannerRepository;

  Future<CameraPermissionStatus> call() => _cardScannerRepository.requestCameraPermission();
}
