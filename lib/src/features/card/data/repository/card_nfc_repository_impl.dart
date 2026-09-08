import 'package:fintech_card_core/fintech_card_core.dart';

import '../../domain/entity/nfc_read_event.dart';
import '../../domain/error/card_exceptions.dart';
import '../../domain/repository/card_nfc_repository.dart';
import '../datasources/local/card_nfc_data_source.dart';
import '../models/nfc_card_model.dart';

final class CardNfcRepositoryImpl implements CardNfcRepository {
  const CardNfcRepositoryImpl({required CardNfcDataSource dataSource}) : _dataSource = dataSource;

  final CardNfcDataSource _dataSource;

  @override
  Stream<NfcReadEvent> get events => _dataSource.states.map(_toEvent);

  @override
  Future<void> startSession() => _dataSource.startSession();

  @override
  Future<void> stopSession() => _dataSource.stopSession();

  @override
  Future<void> dispose() => _dataSource.dispose();

  /// The plugin's state machine is sealed, so this switch cannot silently miss
  /// a case if the package adds one.
  NfcReadEvent _toEvent(CardReaderState state) => switch (state) {
    CardReaderIdleState() => const NfcReadIdle(),
    CardReaderScanningState() => const NfcReadInProgress(),
    CardReaderSuccessState(:final data) => _toResult(data),
    CardReaderErrorState(:final exception) => NfcReadFailed(_toDomainException(exception)),
  };

  /// A success the form cannot use is downgraded to a failure here rather than
  /// half-filling the fields on screen.
  NfcReadEvent _toResult(CardData data) {
    final model = NfcCardModel.fromCardData(data);
    return model == null ? const NfcReadFailed(NfcUnsupportedCardException()) : NfcReadSucceeded(model.toEntity());
  }

  /// The OCR and manual codes are unreachable from this reader — it only ever
  /// runs the NFC path — but the switch stays exhaustive so the package cannot
  /// reroute one of them here unnoticed.
  Exception _toDomainException(CardReaderException exception) => switch (exception.code) {
    .nfcNotAvailable => const NfcUnavailableException(),
    .nfcUnsupportedCard => const NfcUnsupportedCardException(),
    .nfcTagLost || .nfcSessionTimeout => const NfcTagLostException(),
    .nfcTransceiveFailed ||
    .ocrCameraPermissionDenied ||
    .ocrNoCardDetected ||
    .ocrParsingFailed ||
    .manualInputInvalid ||
    .unknown => NfcReadFailedException(exception.message),
  };
}
