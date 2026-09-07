import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_journal_entries_use_case.dart';
import 'journal_cubit_state.dart';

final class JournalCubit extends Cubit<JournalCubitState> {
  JournalCubit({required GetJournalEntriesUseCase getJournalEntriesUseCase})
    : _getJournalEntriesUseCase = getJournalEntriesUseCase,
      super(const JournalCubitState()) {
    load();
  }

  final GetJournalEntriesUseCase _getJournalEntriesUseCase;

  Future<void> load() async {
    emit(state.copyWith(status: .loading, errorMessage: null));
    try {
      final entries = await _getJournalEntriesUseCase();
      emit(state.copyWith(status: .success, entries: entries));
    } catch (e) {
      emit(state.copyWith(status: .error, errorMessage: e.toString()));
    }
  }
}
