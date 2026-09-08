import 'nfc_card_entity.dart';

/// What the NFC reader is doing right now.
///
/// Sealed so the cubit's `switch` is checked for exhaustiveness at compile
/// time: a new event cannot be added without every consumer being forced to
/// handle it.
sealed class NfcReadEvent {
  const NfcReadEvent();
}

/// No session is open. Emitted after a cancel and after the reader shuts down.
final class NfcReadIdle extends NfcReadEvent {
  const NfcReadIdle();
}

/// The session is open and the reader is waiting for — or already talking to —
/// a card.
final class NfcReadInProgress extends NfcReadEvent {
  const NfcReadInProgress();
}

/// The EMV records were parsed into [card].
final class NfcReadSucceeded extends NfcReadEvent {
  const NfcReadSucceeded(this.card);

  final NfcCardEntity card;
}

/// The read ended on [exception], one of the NFC exceptions declared in
/// `card_exceptions.dart`.
final class NfcReadFailed extends NfcReadEvent {
  const NfcReadFailed(this.exception);

  final Exception exception;
}
