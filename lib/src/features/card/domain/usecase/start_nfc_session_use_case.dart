import '../repository/card_nfc_repository.dart';

final class StartNfcSessionUseCase {
  const StartNfcSessionUseCase({required CardNfcRepository cardNfcRepository}) : _cardNfcRepository = cardNfcRepository;

  final CardNfcRepository _cardNfcRepository;

  Future<void> call() => _cardNfcRepository.startSession();
}
