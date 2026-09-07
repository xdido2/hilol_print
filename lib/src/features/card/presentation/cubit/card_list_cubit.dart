import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_cards_use_case.dart';
import 'card_list_cubit_state.dart';

/// Holds the cards saved on the device. The add-card flow runs on its own
/// cubit, so the list is reloaded through [load] once that flow reports back.
final class CardListCubit extends Cubit<CardListCubitState> {
  CardListCubit({required GetCardsUseCase getCardsUseCase})
    : _getCardsUseCase = getCardsUseCase,
      super(const CardListCubitState());

  final GetCardsUseCase _getCardsUseCase;

  Future<void> load() async {
    if (state.status.isLoading) return;
    emit(state.copyWith(status: .loading, errorMessage: null));

    try {
      final cards = await _getCardsUseCase();
      if (isClosed) return;
      emit(state.copyWith(status: .success, cards: cards));
    } on Exception catch (e) {
      if (!isClosed) emit(state.copyWith(status: .error, errorMessage: e.toString()));
    }
  }
}
