import '../entity/card_entity.dart';

abstract interface class CardRepository {
  Future<List<CardEntity>> getCards();

  Future<void> addCard(CardEntity card);
}
