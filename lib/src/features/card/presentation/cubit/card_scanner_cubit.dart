import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/camera_frame_entity.dart';
import '../../domain/entity/camera_permission_status.dart';
import '../../domain/entity/card_scan_entity.dart';
import '../../domain/error/card_exceptions.dart';
import '../../domain/usecase/dispose_card_scanner_use_case.dart';
import '../../domain/usecase/open_app_settings_use_case.dart';
import '../../domain/usecase/recognize_card_use_case.dart';
import '../../domain/usecase/request_camera_permission_use_case.dart';
import 'card_scanner_cubit_state.dart';

/// Resolves the cameras of the device. Injectable so the cubit is testable.
typedef CameraDescriptionsResolver = Future<List<CameraDescription>> Function();

/// Builds the controller for the chosen camera.
typedef CameraControllerFactory = CameraController Function(CameraDescription description);

/// Android streams NV21, iOS streams BGRA — the recognizer has to be told which.
CameraFrameFormat _platformFrameFormat() => Platform.isAndroid ? .nv21 : .bgra8888;

CameraController _platformCameraController(CameraDescription description) => CameraController(
  description,
  .high,
  enableAudio: false,
  imageFormatGroup: Platform.isAndroid ? ImageFormatGroup.nv21 : ImageFormatGroup.bgra8888,
);

/// Owns the camera of the scanner screen: asks for access, streams frames
/// through the recognizer and stops as soon as the PAN and the expiry are both
/// known.
///
/// The controller stays out of the state because it is mutable; the UI reads it
/// through [cameraController] and rebuilds on [CardScannerCubitState.isCameraReady].
final class CardScannerCubit extends Cubit<CardScannerCubitState> {
  CardScannerCubit({
    required RequestCameraPermissionUseCase requestCameraPermissionUseCase,
    required RecognizeCardUseCase recognizeCardUseCase,
    required OpenAppSettingsUseCase openAppSettingsUseCase,
    required DisposeCardScannerUseCase disposeCardScannerUseCase,
    CameraDescriptionsResolver? cameraDescriptionsResolver,
    CameraControllerFactory? cameraControllerFactory,
    CameraFrameFormat? frameFormat,
  }) : _requestCameraPermissionUseCase = requestCameraPermissionUseCase,
       _recognizeCardUseCase = recognizeCardUseCase,
       _openAppSettingsUseCase = openAppSettingsUseCase,
       _disposeCardScannerUseCase = disposeCardScannerUseCase,
       _cameraDescriptionsResolver = cameraDescriptionsResolver ?? availableCameras,
       _cameraControllerFactory = cameraControllerFactory ?? _platformCameraController,
       _frameFormat = frameFormat ?? _platformFrameFormat(),
       super(const CardScannerCubitState());

  /// Recognition is far slower than the preview, so frames are sampled rather
  /// than queued.
  static const Duration _frameInterval = Duration(milliseconds: 350);

  final RequestCameraPermissionUseCase _requestCameraPermissionUseCase;
  final RecognizeCardUseCase _recognizeCardUseCase;
  final OpenAppSettingsUseCase _openAppSettingsUseCase;
  final DisposeCardScannerUseCase _disposeCardScannerUseCase;
  final CameraDescriptionsResolver _cameraDescriptionsResolver;
  final CameraControllerFactory _cameraControllerFactory;
  final CameraFrameFormat _frameFormat;

  CameraController? _controller;
  bool _isProcessingFrame = false;
  int _rotationDegrees = 0;
  DateTime _lastFrameAt = .fromMillisecondsSinceEpoch(0);

  /// Enumerating the cameras is a platform round trip; the set cannot change
  /// while the screen is up, so it is resolved once and reused when the camera
  /// is reopened after a background.
  List<CameraDescription>? _cameras;

  /// Camera work runs one at a time. Opening spans several awaits, and a
  /// lifecycle event landing in the middle of it used to dispose a controller
  /// that was still initializing — or open a second one on top of it.
  Future<void> _cameraOperation = Future<void>.value();

  /// True while the system permission dialog is up. The dialog takes the focus
  /// away, so the lifecycle events it produces describe the dialog rather than
  /// the app leaving the foreground.
  bool _isRequestingPermission = false;

  bool _isForeground = true;

  /// Live controller for [CameraPreview]; `null` until the camera is ready.
  CameraController? get cameraController => _controller;

  /// Asks for camera access and, once granted, opens the camera.
  Future<void> start() async {
    if (state.status.isLoading) return;
    emit(state.copyWith(status: .loading, action: .permission, errorMessage: null));

    final CameraPermissionStatus permission;
    try {
      permission = await _requestPermission();
    } on Exception catch (e) {
      if (!isClosed) emit(state.copyWith(status: .error, action: .permission, errorMessage: e.toString()));
      return;
    }

    if (isClosed) return;

    if (!permission.isGranted) {
      emit(
        state.copyWith(
          status: .error,
          action: .permission,
          permission: permission,
          isCameraReady: false,
          errorMessage: CameraPermissionDeniedException(isPermanent: permission.isPermanentlyDenied).toString(),
        ),
      );
      return;
    }

    emit(state.copyWith(permission: permission));

    // Answering the dialog can hand the result back before the app is on screen
    // again; [onAppResumed] picks the camera up as soon as it is.
    if (!_isForeground) return;
    await _openCamera();
  }

  /// Sends the user to the system settings after a permanent denial.
  Future<void> openSettings() => _openAppSettingsUseCase();

  Future<void> toggleTorch() async {
    final controller = _controller;
    if (controller == null || !state.isCameraReady) return;

    final isEnabled = !state.isTorchEnabled;
    try {
      await controller.setFlashMode(isEnabled ? .torch : .off);
      if (!isClosed) emit(state.copyWith(action: .torch, isTorchEnabled: isEnabled));
    } on CameraException {
      // A device without a torch keeps the button in its off state.
      if (!isClosed) emit(state.copyWith(action: .torch, isTorchEnabled: false));
    }
  }

  /// Releases the camera when the app is backgrounded: the handle is revoked
  /// there anyway, so it is reopened from scratch in [onAppResumed].
  ///
  /// Losing the focus alone (a permission dialog, the notification shade) is
  /// not a background and must not reach this method — the handle survives it.
  Future<void> onAppPaused() async {
    _isForeground = false;
    if (_isRequestingPermission) return;

    await _disposeCamera();
    if (isClosed || (!state.isCameraReady && !state.isTorchEnabled)) return;
    emit(state.copyWith(action: .camera, isCameraReady: false, isTorchEnabled: false));
  }

  Future<void> onAppResumed() async {
    _isForeground = true;
    // The permission dialog is still up, or has just closed: [start] owns the
    // camera until it returns.
    if (_isRequestingPermission) return;
    if (_controller != null || !(state.permission?.isGranted ?? false) || state.isRecognized) return;
    await _openCamera();
  }

  @override
  Future<void> close() async {
    await _disposeCamera();
    await _disposeCardScannerUseCase();
    return super.close();
  }

  Future<CameraPermissionStatus> _requestPermission() async {
    _isRequestingPermission = true;
    try {
      return await _requestCameraPermissionUseCase();
    } finally {
      _isRequestingPermission = false;
    }
  }

  /// Queues camera work behind whatever is already running so that an open and
  /// a dispose can never interleave.
  Future<void> _runOnCamera(Future<void> Function() operation) {
    final Future<void> result = _cameraOperation.then((_) => operation());
    _cameraOperation = result.then((_) {}, onError: (_, _) {});
    return result;
  }

  Future<void> _openCamera() => _runOnCamera(_openCameraExclusive);

  Future<void> _disposeCamera() => _runOnCamera(_disposeCameraExclusive);

  Future<void> _openCameraExclusive() async {
    // A camera is already up, or the screen is gone: nothing to open.
    if (isClosed || _controller != null) return;

    try {
      final List<CameraDescription> cameras = _cameras ?? await _cameraDescriptionsResolver();
      if (isClosed) return;
      if (cameras.isEmpty) throw const CameraUnavailableException();
      _cameras = cameras;

      final CameraDescription description = cameras.firstWhere(
        (camera) => camera.lensDirection == .back,
        orElse: () => cameras.first,
      );

      final CameraController controller = _cameraControllerFactory(description);
      _controller = controller;
      await controller.initialize();

      if (isClosed) {
        await _disposeCameraExclusive();
        return;
      }

      // The sensor is mounted rotated on Android; iOS resolves it itself.
      _rotationDegrees = Platform.isAndroid ? description.sensorOrientation : 0;
      await controller.startImageStream(_onFrame);
      if (isClosed) return;

      emit(state.copyWith(status: .success, action: .camera, isCameraReady: true, errorMessage: null));
    } on CameraUnavailableException catch (e) {
      await _failCamera(e.toString());
    } on CameraException catch (e) {
      await _failCamera(e.description ?? e.code);
    } on Exception catch (e) {
      await _failCamera(e.toString());
    }
  }

  /// Drops the half-open controller before reporting, so a retry — or the next
  /// resume — starts from a clean slate instead of a dead handle.
  Future<void> _failCamera(String message) async {
    await _disposeCameraExclusive();
    if (isClosed) return;
    emit(state.copyWith(status: .error, action: .camera, isCameraReady: false, errorMessage: message));
  }

  Future<void> _onFrame(CameraImage image) async {
    if (isClosed || _isProcessingFrame || state.isRecognized) return;

    final DateTime now = .now();
    if (now.difference(_lastFrameAt) < _frameInterval) return;

    _isProcessingFrame = true;
    _lastFrameAt = now;

    try {
      final CardScanEntity result = await _recognizeCardUseCase(_toFrame(image));
      if (isClosed || result.isEmpty) return;

      final CardScanEntity merged = state.scan.mergeWith(result);
      if (merged == state.scan) return;

      emit(state.copyWith(status: .success, action: .recognition, scan: merged));
      if (merged.isComplete) await _stopImageStream();
    } on TextRecognitionException {
      // An unreadable frame is not worth surfacing — the next one is 350ms away.
    } on Exception {
      // Same for a malformed frame: dropping it keeps the preview alive.
    } finally {
      _isProcessingFrame = false;
    }
  }

  CameraFrameEntity _toFrame(CameraImage image) {
    // Both configured formats are single-plane, so the first plane is the frame.
    final Plane plane = image.planes.first;

    return CameraFrameEntity(
      bytes: plane.bytes,
      width: image.width,
      height: image.height,
      bytesPerRow: plane.bytesPerRow,
      format: _frameFormat,
      rotationDegrees: _rotationDegrees,
    );
  }

  Future<void> _stopImageStream() async {
    final controller = _controller;
    if (controller == null || !controller.value.isStreamingImages) return;

    try {
      await controller.stopImageStream();
    } on CameraException {
      // The stream is already gone; nothing left to release.
    }
  }

  Future<void> _disposeCameraExclusive() async {
    final controller = _controller;
    _controller = null;
    if (controller == null) return;

    if (controller.value.isStreamingImages) {
      try {
        await controller.stopImageStream();
      } on CameraException {
        // Ignored: the controller is being torn down anyway.
      }
    }

    await controller.dispose();
  }
}
