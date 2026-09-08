import '../entity/nfc_read_event.dart';

abstract interface class CardNfcRepository {
  /// Every transition of the reader, from the session opening to the result.
  ///
  /// A broadcast stream: subscribing does not start anything, and the same
  /// reader can be observed from more than one place.
  Stream<NfcReadEvent> get events;

  /// Opens the NFC session.
  ///
  /// Deliberately does not throw: a missing or disabled chip arrives as
  /// [NfcReadFailed] on [events], so the UI has exactly one failure path.
  Future<void> startSession();

  /// Closes the session without waiting for a card.
  Future<void> stopSession();

  /// Releases the reader. Safe to call more than once.
  Future<void> dispose();
}
