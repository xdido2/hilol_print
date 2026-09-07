import '../repository/auth_repository.dart';

final class LogoutUseCase {
  const LogoutUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<void> call() => _authRepository.logout();
}
