import 'package:fintech_card_core/fintech_card_core.dart';

/// Builds the reader. Injectable so the repository can be tested without the
/// platform channel behind it.
typedef NfcCardReaderFactory = NfcCardReader Function();

abstract interface class CardNfcDataSource {
  Stream<CardReaderState> get states;

  Future<void> startSession();

  Future<void> stopSession();

  Future<void> dispose();
}

/// Thin wrapper over [NfcCardReader].
///
/// [NfcCardReader] is used directly rather than the plugin's
/// `CardReaderController`, because that controller also wires up the bundled
/// OCR scanner and opens its own camera — this feature already has a camera
/// pipeline of its own in [CardScannerCubit].
final class CardNfcDataSourceImpl implements CardNfcDataSource {
  CardNfcDataSourceImpl({NfcCardReaderFactory? readerFactory}) : _readerFactory = readerFactory ?? NfcCardReader.new;

  final NfcCardReaderFactory _readerFactory;

  /// Built on first use and dropped on [dispose].
  ///
  /// [NfcCardReader.dispose] closes its state controller for good, so a reader
  /// that has been disposed can never emit again — the next scan needs a fresh
  /// instance. Same reason [CardScannerDataSourceImpl] rebuilds its
  /// `TextRecognizer`.
  NfcCardReader? _reader;

  NfcCardReader get _nfcReader => _reader ??= _readerFactory();

  @override
  Stream<CardReaderState> get states => _nfcReader.stateStream;

  @override
  Future<void> startSession() => _nfcReader.startScan();

  /// Reads the field rather than the getter: stopping a session that was never
  /// opened must not build a reader just to shut it down.
  @override
  Future<void> stopSession() async {
    await _reader?.stopScan();
  }

  @override
  Future<void> dispose() async {
    final reader = _reader;
    _reader = null;
    await reader?.dispose();
  }
}
