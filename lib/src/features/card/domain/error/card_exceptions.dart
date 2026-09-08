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

// ── NFC ─────────────────────────────────────────────────────────────────────

/// Thrown when the device has no NFC chip, it is switched off, or the platform
/// refuses to open a payment session at all (the iOS case).
final class NfcUnavailableException implements Exception {
  const NfcUnavailableException();

  @override
  String toString() => 'NFC is unavailable on this device';
}

/// Thrown when a tag answered but carried no readable EMV payment application.
final class NfcUnsupportedCardException implements Exception {
  const NfcUnsupportedCardException();

  @override
  String toString() => 'This card cannot be read over NFC';
}

/// Thrown when the card left the field before the read finished, or the
/// session timed out waiting for one.
final class NfcTagLostException implements Exception {
  const NfcTagLostException();

  @override
  String toString() => 'Card moved away too early';
}

/// Thrown when the APDU exchange failed for any other reason.
///
/// [details] carries the message the plugin produced, which is more useful on
/// screen than a generic string when a specific card misbehaves.
final class NfcReadFailedException implements Exception {
  const NfcReadFailedException([this.details]);

  final String? details;

  @override
  String toString() => details ?? 'Could not read the card over NFC';
}
