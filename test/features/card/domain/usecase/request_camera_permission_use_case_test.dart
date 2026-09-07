import 'package:flutter_test/flutter_test.dart';
import 'package:hilol_print/src/features/card/domain/entity/camera_permission_status.dart';
import 'package:hilol_print/src/features/card/domain/repository/card_scanner_repository.dart';
import 'package:hilol_print/src/features/card/domain/usecase/request_camera_permission_use_case.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardScannerRepository extends Mock implements CardScannerRepository {}

void main() {
  late _MockCardScannerRepository repository;
  late RequestCameraPermissionUseCase useCase;

  setUp(() {
    repository = _MockCardScannerRepository();
    useCase = RequestCameraPermissionUseCase(cardScannerRepository: repository);
  });

  group('RequestCameraPermissionUseCase', () {
    test('returns the status reported by the repository', () async {
      when(() => repository.requestCameraPermission()).thenAnswer((_) async => CameraPermissionStatus.granted);

      expect(await useCase(), CameraPermissionStatus.granted);
      verify(() => repository.requestCameraPermission()).called(1);
    });

    test('propagates a permanent denial unchanged', () async {
      when(
        () => repository.requestCameraPermission(),
      ).thenAnswer((_) async => CameraPermissionStatus.permanentlyDenied);

      expect(await useCase(), CameraPermissionStatus.permanentlyDenied);
    });
  });
}
