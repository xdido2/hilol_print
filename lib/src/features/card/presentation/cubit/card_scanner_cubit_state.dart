import 'package:flutter/foundation.dart';

import '../../../../common/data/enums/bloc_status_enum.dart';
import '../../domain/entity/camera_permission_status.dart';
import '../../domain/entity/card_scan_entity.dart';

/// Which operation produced the current state, so the screen can react to the
/// camera failing without also reacting to a frame that recognized nothing.
enum CardScannerAction { permission, camera, recognition, torch }

@immutable
final class CardScannerCubitState {
  const CardScannerCubitState({
    this.status = Status.initial,
    this.action,
    this.permission,
    this.scan = const CardScanEntity(),
    this.isCameraReady = false,
    this.isTorchEnabled = false,
    this.errorMessage,
  });

  final Status status;
  final CardScannerAction? action;

  /// `null` until the permission has been asked for.
  final CameraPermissionStatus? permission;

  final CardScanEntity scan;
  final bool isCameraReady;
  final bool isTorchEnabled;
  final String? errorMessage;

  bool get isRecognized => scan.isComplete;

  bool get isPermissionDenied => permission != null && !permission!.isGranted;

  bool get isPermissionPermanentlyDenied => permission?.isPermanentlyDenied ?? false;

  CardScannerCubitState copyWith({
    Status? status,
    CardScannerAction? action,
    CameraPermissionStatus? permission,
    CardScanEntity? scan,
    bool? isCameraReady,
    bool? isTorchEnabled,
    String? errorMessage,
  }) => CardScannerCubitState(
    status: status ?? this.status,
    action: action ?? this.action,
    permission: permission ?? this.permission,
    scan: scan ?? this.scan,
    isCameraReady: isCameraReady ?? this.isCameraReady,
    isTorchEnabled: isTorchEnabled ?? this.isTorchEnabled,
    errorMessage: errorMessage,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardScannerCubitState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          action == other.action &&
          permission == other.permission &&
          scan == other.scan &&
          isCameraReady == other.isCameraReady &&
          isTorchEnabled == other.isTorchEnabled &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => Object.hash(status, action, permission, scan, isCameraReady, isTorchEnabled, errorMessage);
}
