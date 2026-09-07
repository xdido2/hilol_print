import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_profile_use_case.dart';
import 'profile_cubit_state.dart';

final class ProfileCubit extends Cubit<ProfileCubitState> {
  ProfileCubit({required GetProfileUseCase getProfileUseCase})
    : _getProfileUseCase = getProfileUseCase,
      super(const ProfileCubitState()) {
    load();
  }

  final GetProfileUseCase _getProfileUseCase;

  Future<void> load() async {
    emit(state.copyWith(status: .loading, errorMessage: null));
    try {
      final profile = await _getProfileUseCase();
      emit(state.copyWith(status: .success, profile: profile));
    } catch (e) {
      emit(state.copyWith(status: .error, errorMessage: e.toString()));
    }
  }
}
