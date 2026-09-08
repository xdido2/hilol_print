import '../repository/card_nfc_repository.dart';

final class StopNfcSessionUseCase {
  const StopNfcSessionUseCase({required CardNfcRepository cardNfcRepository}) : _cardNfcRepository = cardNfcRepository;

  final CardNfcRepository _cardNfcRepository;

  Future<void> call() => _cardNfcRepository.stopSession();
}
