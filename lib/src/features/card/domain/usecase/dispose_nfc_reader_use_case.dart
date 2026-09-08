import '../repository/card_nfc_repository.dart';

final class DisposeNfcReaderUseCase {
  const DisposeNfcReaderUseCase({required CardNfcRepository cardNfcRepository}) : _cardNfcRepository = cardNfcRepository;

  final CardNfcRepository _cardNfcRepository;

  Future<void> call() => _cardNfcRepository.dispose();
}
