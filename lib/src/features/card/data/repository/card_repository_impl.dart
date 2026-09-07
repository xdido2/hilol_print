import '../../domain/entity/card_entity.dart';
import '../../domain/error/card_exceptions.dart';
import '../../domain/repository/card_repository.dart';
import '../datasources/local/card_local_data_source.dart';
import '../models/card_model.dart';

final class CardRepositoryImpl implements CardRepository {
  const CardRepositoryImpl({required CardLocalDataSource localDataSource}) : _localDataSource = localDataSource;

  final CardLocalDataSource _localDataSource;

  @override
  Future<List<CardEntity>> getCards() async {
    final savedCards = await _localDataSource.getCards();
    return savedCards.map((saved) => saved.toEntity()).toList(growable: false);
  }

  @override
  Future<void> addCard(CardEntity card) async {
    final savedCards = await _localDataSource.getCards();
    final isDuplicate = savedCards.any((saved) => saved.panNumber == card.panNumber);
    if (isDuplicate) throw const DuplicateCardException();

    await _localDataSource.addCard(CardModel.fromEntity(card));
  }
}
