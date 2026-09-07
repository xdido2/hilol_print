/// Camera authorization as the domain sees it.
enum CameraPermissionStatus {
  granted,
  denied,

  /// Denied for good: only the system settings can flip it back.
  permanentlyDenied;

  bool get isGranted => this == .granted;

  bool get isPermanentlyDenied => this == .permanentlyDenied;
}
