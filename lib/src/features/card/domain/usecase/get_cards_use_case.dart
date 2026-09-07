import '../entity/card_entity.dart';
import '../repository/card_repository.dart';

final class GetCardsUseCase {
  const GetCardsUseCase({required CardRepository cardRepository}) : _cardRepository = cardRepository;

  final CardRepository _cardRepository;

  Future<List<CardEntity>> call() => _cardRepository.getCards();
}
