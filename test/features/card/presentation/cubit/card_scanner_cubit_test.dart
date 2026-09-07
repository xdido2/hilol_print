import 'package:bloc_test/bloc_test.dart';
import 'package:camera/camera.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hilol_print/src/features/card/domain/entity/camera_permission_status.dart';
import 'package:hilol_print/src/features/card/domain/repository/card_scanner_repository.dart';
import 'package:hilol_print/src/features/card/domain/usecase/dispose_card_scanner_use_case.dart';
import 'package:hilol_print/src/features/card/domain/usecase/open_app_settings_use_case.dart';
import 'package:hilol_print/src/features/card/domain/usecase/recognize_card_use_case.dart';
import 'package:hilol_print/src/features/card/domain/usecase/request_camera_permission_use_case.dart';
import 'package:hilol_print/src/features/card/presentation/cubit/card_scanner_cubit.dart';
import 'package:hilol_print/src/features/card/presentation/cubit/card_scanner_cubit_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardScannerRepository extends Mock implements CardScannerRepository {}

class _MockCameraController extends Mock implements CameraController {}

const _description = CameraDescription(name: 'back', lensDirection: .back, sensorOrientation: 90);

/// Fallback for the image-stream callback `any()` matcher.
void _ignoreFrame(CameraImage image) {}

void main() {
  late _MockCardScannerRepository repository;
  late _MockCameraController controller;

  setUpAll(() {
    registerFallbackValue(FlashMode.off);
    registerFallbackValue(_ignoreFrame);
  });

  setUp(() {
    repository = _MockCardScannerRepository();
    controller = _MockCameraController();

    when(() => repository.dispose()).thenAnswer((_) async {});
    when(() => controller.initialize()).thenAnswer((_) async {});
    when(() => controller.startImageStream(any())).thenAnswer((_) async {});
    when(() => controller.stopImageStream()).thenAnswer((_) async {});
    when(() => controller.dispose()).thenAnswer((_) async {});
    when(() => controller.setFlashMode(any())).thenAnswer((_) async {});
    when(
      () => controller.value,
    ).thenReturn(const CameraValue.uninitialized(_description).copyWith(isInitialized: true, isStreamingImages: true));
  });

  CardScannerCubit buildCubit({List<CameraDescription> cameras = const <CameraDescription>[_description]}) =>
      CardScannerCubit(
        requestCameraPermissionUseCase: RequestCameraPermissionUseCase(cardScannerRepository: repository),
        recognizeCardUseCase: RecognizeCardUseCase(cardScannerRepository: repository),
        openAppSettingsUseCase: OpenAppSettingsUseCase(cardScannerRepository: repository),
        disposeCardScannerUseCase: DisposeCardScannerUseCase(cardScannerRepository: repository),
        cameraDescriptionsResolver: () async => cameras,
        cameraControllerFactory: (_) => controller,
        frameFormat: .nv21,
      );

  void givenPermission(CameraPermissionStatus status) =>
      when(() => repository.requestCameraPermission()).thenAnswer((_) async => status);

  const askingPermission = CardScannerCubitState(status: .loading, action: .permission);

  group('CardScannerCubit', () {
    blocTest<CardScannerCubit, CardScannerCubitState>(
      'opens the camera once access is granted',
      setUp: () => givenPermission(.granted),
      build: buildCubit,
      act: (cubit) => cubit.start(),
      expect: () => <CardScannerCubitState>[
        askingPermission,
        askingPermission.copyWith(permission: .granted),
        askingPermission.copyWith(
          status: .success,
          action: .camera,
          permission: .granted,
          isCameraReady: true,
        ),
      ],
      verify: (_) {
        verify(() => controller.initialize()).called(1);
        verify(() => controller.startImageStream(any())).called(1);
      },
    );

    blocTest<CardScannerCubit, CardScannerCubitState>(
      'never touches the camera when access is denied',
      setUp: () => givenPermission(.denied),
      build: buildCubit,
      act: (cubit) => cubit.start(),
      expect: () => <CardScannerCubitState>[
        askingPermission,
        askingPermission.copyWith(
          status: .error,
          permission: .denied,
          errorMessage: 'Camera access denied',
        ),
      ],
      verify: (_) => verifyNever(() => controller.initialize()),
    );

    blocTest<CardScannerCubit, CardScannerCubitState>(
      'flags a permanent denial so the screen can offer the settings',
      setUp: () => givenPermission(.permanentlyDenied),
      build: buildCubit,
      act: (cubit) => cubit.start(),
      verify: (cubit) {
        expect(cubit.state.isPermissionDenied, isTrue);
        expect(cubit.state.isPermissionPermanentlyDenied, isTrue);
      },
    );

    blocTest<CardScannerCubit, CardScannerCubitState>(
      'ignores a second start while the first one is still running',
      setUp: () => givenPermission(.granted),
      build: buildCubit,
      act: (cubit) async {
        await Future.wait(<Future<void>>[cubit.start(), cubit.start()]);
      },
      verify: (_) {
        verify(() => repository.requestCameraPermission()).called(1);
        verify(() => controller.initialize()).called(1);
      },
    );

    blocTest<CardScannerCubit, CardScannerCubitState>(
      'reports an error when the device exposes no camera',
      setUp: () => givenPermission(.granted),
      build: () => buildCubit(cameras: const <CameraDescription>[]),
      act: (cubit) => cubit.start(),
      verify: (cubit) {
        expect(cubit.state.status.isError, isTrue);
        expect(cubit.state.action, CardScannerAction.camera);
        expect(cubit.state.isCameraReady, isFalse);
        expect(cubit.state.errorMessage, 'Camera is unavailable');
      },
    );

    blocTest<CardScannerCubit, CardScannerCubitState>(
      'does not toggle the torch before the camera is ready',
      build: buildCubit,
      act: (cubit) => cubit.toggleTorch(),
      expect: () => const <CardScannerCubitState>[],
      verify: (_) => verifyNever(() => controller.setFlashMode(any())),
    );

    blocTest<CardScannerCubit, CardScannerCubitState>(
      'turns the torch on and back off once the camera is ready',
      setUp: () => givenPermission(.granted),
      build: buildCubit,
      act: (cubit) async {
        await cubit.start();
        await cubit.toggleTorch();
        await cubit.toggleTorch();
      },
      skip: 3,
      expect: () => const <CardScannerCubitState>[
        CardScannerCubitState(
          status: .success,
          action: .torch,
          permission: .granted,
          isCameraReady: true,
          isTorchEnabled: true,
        ),
        CardScannerCubitState(
          status: .success,
          action: .torch,
          permission: .granted,
          isCameraReady: true,
        ),
      ],
      verify: (_) {
        verify(() => controller.setFlashMode(.torch)).called(1);
        verify(() => controller.setFlashMode(.off)).called(1);
      },
    );

    blocTest<CardScannerCubit, CardScannerCubitState>(
      'releases the camera when the app leaves the foreground',
      setUp: () => givenPermission(.granted),
      build: buildCubit,
      act: (cubit) async {
        await cubit.start();
        await cubit.onAppInactive();
      },
      verify: (cubit) {
        expect(cubit.state.isCameraReady, isFalse);
        expect(cubit.cameraController, isNull);
        verify(() => controller.dispose()).called(1);
      },
    );

    blocTest<CardScannerCubit, CardScannerCubitState>(
      'openSettings delegates to the repository',
      build: buildCubit,
      setUp: () => when(() => repository.openAppSettings()).thenAnswer((_) async {}),
      act: (cubit) => cubit.openSettings(),
      expect: () => const <CardScannerCubitState>[],
      verify: (_) => verify(() => repository.openAppSettings()).called(1),
    );

    blocTest<CardScannerCubit, CardScannerCubitState>(
      'closes the recognizer when the cubit is closed',
      setUp: () => givenPermission(.granted),
      build: buildCubit,
      act: (cubit) => cubit.start(),
      verify: (_) => verify(() => repository.dispose()).called(1),
    );
  });
}
