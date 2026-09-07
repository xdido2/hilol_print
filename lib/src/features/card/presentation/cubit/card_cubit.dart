import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/card_entity.dart';
import '../../domain/error/card_exceptions.dart';
import '../../domain/usecase/add_card_use_case.dart';
import 'card_cubit_state.dart';

final class CardCubit extends Cubit<CardCubitState> {
  CardCubit({required AddCardUseCase addCardUseCase}) : _addCardUseCase = addCardUseCase, super(const CardCubitState());

  final AddCardUseCase _addCardUseCase;

  Future<void> addCard(CardEntity card) async {
    if (state.status.isLoading) return;
    emit(state.copyWith(status: .loading, errorMessage: null));
    try {
      await _addCardUseCase(card);
      emit(state.copyWith(status: .success, card: card));
    } on DuplicateCardException catch (e) {
      emit(state.copyWith(status: .error, errorMessage: e.toString()));
    } catch (e) {
      emit(state.copyWith(status: .error, errorMessage: e.toString()));
    }
  }
}
