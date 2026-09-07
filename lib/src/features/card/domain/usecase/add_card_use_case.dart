import '../entity/card_entity.dart';
import '../repository/card_repository.dart';

final class AddCardUseCase {
  const AddCardUseCase({required CardRepository cardRepository}) : _cardRepository = cardRepository;

  final CardRepository _cardRepository;

  Future<void> call(CardEntity card) => _cardRepository.addCard(card);
}
