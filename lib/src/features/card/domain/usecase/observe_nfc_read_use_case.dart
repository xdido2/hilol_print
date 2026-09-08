import '../entity/nfc_read_event.dart';
import '../repository/card_nfc_repository.dart';

final class ObserveNfcReadUseCase {
  const ObserveNfcReadUseCase({required CardNfcRepository cardNfcRepository}) : _cardNfcRepository = cardNfcRepository;

  final CardNfcRepository _cardNfcRepository;

  Stream<NfcReadEvent> call() => _cardNfcRepository.events;
}
