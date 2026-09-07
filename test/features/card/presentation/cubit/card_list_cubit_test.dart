import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hilol_print/src/common/data/enums/bloc_status_enum.dart';
import 'package:hilol_print/src/features/card/domain/entity/card_entity.dart';
import 'package:hilol_print/src/features/card/domain/repository/card_repository.dart';
import 'package:hilol_print/src/features/card/domain/usecase/get_cards_use_case.dart';
import 'package:hilol_print/src/features/card/presentation/cubit/card_list_cubit.dart';
import 'package:hilol_print/src/features/card/presentation/cubit/card_list_cubit_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardRepository extends Mock implements CardRepository {}

void main() {
  late _MockCardRepository repository;

  const card = CardEntity(panNumber: '8600123456789012', cardExpire: '12/28');

  setUp(() => repository = _MockCardRepository());

  CardListCubit buildCubit() => CardListCubit(getCardsUseCase: GetCardsUseCase(cardRepository: repository));

  group('CardListCubit', () {
    blocTest<CardListCubit, CardListCubitState>(
      'emits loading then success with the saved cards',
      setUp: () => when(() => repository.getCards()).thenAnswer((_) async => const [card]),
      build: buildCubit,
      act: (cubit) => cubit.load(),
      expect: () => const [
        CardListCubitState(status: Status.loading),
        CardListCubitState(status: Status.success, cards: [card]),
      ],
    );

    blocTest<CardListCubit, CardListCubitState>(
      'emits an error message when the repository throws',
      setUp: () => when(() => repository.getCards()).thenThrow(Exception('boom')),
      build: buildCubit,
      act: (cubit) => cubit.load(),
      expect: () => [
        const CardListCubitState(status: Status.loading),
        isA<CardListCubitState>()
            .having((state) => state.status, 'status', Status.error)
            .having((state) => state.errorMessage, 'errorMessage', contains('boom')),
      ],
    );

    blocTest<CardListCubit, CardListCubitState>(
      'ignores a second load while the first one is still running',
      setUp: () => when(() => repository.getCards()).thenAnswer((_) async => const [card]),
      build: buildCubit,
      act: (cubit) {
        cubit.load();
        return cubit.load();
      },
      expect: () => const [
        CardListCubitState(status: Status.loading),
        CardListCubitState(status: Status.success, cards: [card]),
      ],
      verify: (_) => verify(() => repository.getCards()).called(1),
    );
  });
}
