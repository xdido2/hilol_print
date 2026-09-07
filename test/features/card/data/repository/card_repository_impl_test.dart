import 'package:flutter_test/flutter_test.dart';
import 'package:hilol_print/src/features/card/data/datasources/local/card_local_data_source.dart';
import 'package:hilol_print/src/features/card/data/models/card_model.dart';
import 'package:hilol_print/src/features/card/data/repository/card_repository_impl.dart';
import 'package:hilol_print/src/features/card/domain/entity/card_entity.dart';
import 'package:hilol_print/src/features/card/domain/error/card_exceptions.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardLocalDataSource extends Mock implements CardLocalDataSource {}

void main() {
  late _MockCardLocalDataSource dataSource;
  late CardRepositoryImpl repository;

  const model = CardModel(panNumber: '8600123456789012', cardExpire: '12/28');
  const card = CardEntity(panNumber: '8600123456789012', cardExpire: '12/28');

  setUpAll(() => registerFallbackValue(model));

  setUp(() {
    dataSource = _MockCardLocalDataSource();
    repository = CardRepositoryImpl(localDataSource: dataSource);
  });

  group('CardRepositoryImpl.getCards', () {
    test('maps the stored models to entities', () async {
      when(() => dataSource.getCards()).thenAnswer((_) async => const [model]);

      expect(await repository.getCards(), const [card]);
      verify(() => dataSource.getCards()).called(1);
    });

    test('returns an empty list when nothing is stored', () async {
      when(() => dataSource.getCards()).thenAnswer((_) async => const <CardModel>[]);

      expect(await repository.getCards(), isEmpty);
    });
  });

  group('CardRepositoryImpl.addCard', () {
    test('delegates the mapped model to the data source', () async {
      when(() => dataSource.getCards()).thenAnswer((_) async => const <CardModel>[]);
      when(() => dataSource.addCard(any())).thenAnswer((_) async {});

      await repository.addCard(card);

      final captured = verify(() => dataSource.addCard(captureAny())).captured.single as CardModel;
      expect(captured.panNumber, card.panNumber);
      expect(captured.cardExpire, card.cardExpire);
    });

    test('rejects a PAN that is already stored', () async {
      when(() => dataSource.getCards()).thenAnswer((_) async => const [model]);

      await expectLater(repository.addCard(card), throwsA(isA<DuplicateCardException>()));
      verifyNever(() => dataSource.addCard(any()));
    });
  });
}
