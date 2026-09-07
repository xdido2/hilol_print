import '../entities/auth_session_entity.dart';
import '../repository/auth_repository.dart';

final class LoginUseCase {
  const LoginUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<AuthSessionEntity> call({required String username, required String password}) =>
      _authRepository.login(username: username, password: password);
}
