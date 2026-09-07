/// Thrown when a card with the same PAN has already been saved.
final class DuplicateCardException implements Exception {
  const DuplicateCardException();

  @override
  String toString() => 'This card has already been added';
}

/// Thrown when the user refused camera access.
final class CameraPermissionDeniedException implements Exception {
  const CameraPermissionDeniedException({this.isPermanent = false});

  /// `true` when only the system settings can restore access.
  final bool isPermanent;

  @override
  String toString() => 'Camera access denied';
}

/// Thrown when no usable camera could be opened on the device.
final class CameraUnavailableException implements Exception {
  const CameraUnavailableException();

  @override
  String toString() => 'Camera is unavailable';
}

/// Thrown when the recognizer failed to process a frame.
final class TextRecognitionException implements Exception {
  const TextRecognitionException();

  @override
  String toString() => 'Could not read the card';
}
