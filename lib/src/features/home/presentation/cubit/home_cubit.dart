import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_home_items_use_case.dart';
import 'home_cubit_state.dart';

final class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit({required GetHomeItemsUseCase getHomeItemsUseCase})
    : _getHomeItemsUseCase = getHomeItemsUseCase,
      super(const HomeCubitState()) {
    load();
  }

  final GetHomeItemsUseCase _getHomeItemsUseCase;

  Future<void> load() async {
    emit(state.copyWith(status: .loading, errorMessage: null));
    try {
      final items = await _getHomeItemsUseCase();
      emit(state.copyWith(status: .success, items: items));
    } catch (e) {
      emit(state.copyWith(status: .error, errorMessage: e.toString()));
    }
  }
}
