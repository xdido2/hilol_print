import '../repository/card_scanner_repository.dart';

final class DisposeCardScannerUseCase {
  const DisposeCardScannerUseCase({required CardScannerRepository cardScannerRepository})
    : _cardScannerRepository = cardScannerRepository;

  final CardScannerRepository _cardScannerRepository;

  Future<void> call() => _cardScannerRepository.dispose();
}
