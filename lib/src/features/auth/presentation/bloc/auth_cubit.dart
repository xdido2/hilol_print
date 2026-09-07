import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/error/auth_exceptions.dart';
import '../../domain/usecase/login_use_case.dart';
import '../../domain/usecase/logout_use_case.dart';
import 'auth_cubit_state.dart';

final class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit({required LoginUseCase loginUseCase, required LogoutUseCase logoutUseCase})
    : _loginUseCase = loginUseCase,
      _logoutUseCase = logoutUseCase,
      super(const AuthCubitState());

  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;

  void clearError() {
    if (!state.status.isError && state.errorMessage == null) return;
    emit(state.copyWith(status: .initial, action: .none, errorMessage: null));
  }

  Future<void> login({required String username, required String password}) async {
    if (state.status.isLoading) return;
    emit(state.copyWith(status: .loading, action: .login, errorMessage: null));
    try {
      final session = await _loginUseCase(username: username, password: password);
      emit(state.copyWith(status: .success, action: .login, session: session));
    } on InvalidCredentialsException catch (e) {
      emit(state.copyWith(status: .error, action: .login, errorMessage: e.toString()));
    } catch (e) {
      emit(state.copyWith(status: .error, action: .login, errorMessage: e.toString()));
    }
  }

  Future<void> logout() async {
    if (state.status.isLoading) return;
    emit(state.copyWith(status: .loading, action: .logout, errorMessage: null));
    await _logoutUseCase();
    emit(state.copyWith(status: .success, action: .logout, session: null));
  }
}
