import 'package:flutter_test/flutter_test.dart';
import 'package:hilol_print/src/features/card/domain/entity/card_entity.dart';
import 'package:hilol_print/src/features/card/domain/repository/card_repository.dart';
import 'package:hilol_print/src/features/card/domain/usecase/get_cards_use_case.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardRepository extends Mock implements CardRepository {}

void main() {
  late _MockCardRepository repository;
  late GetCardsUseCase useCase;

  const card = CardEntity(panNumber: '8600123456789012', cardExpire: '12/28');

  setUp(() {
    repository = _MockCardRepository();
    useCase = GetCardsUseCase(cardRepository: repository);
  });

  group('GetCardsUseCase', () {
    test('returns the cards reported by the repository', () async {
      when(() => repository.getCards()).thenAnswer((_) async => const [card]);

      expect(await useCase(), const [card]);
      verify(() => repository.getCards()).called(1);
    });

    test('returns an empty list when nothing is saved', () async {
      when(() => repository.getCards()).thenAnswer((_) async => const <CardEntity>[]);

      expect(await useCase(), isEmpty);
    });
  });
}
