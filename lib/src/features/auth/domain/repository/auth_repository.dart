import '../entities/auth_session_entity.dart';

abstract interface class AuthRepository {
  Future<AuthSessionEntity> login({required String username, required String password});

  Future<void> saveSession(AuthSessionEntity session);

  Future<void> logout();

  bool get isAuthenticated;
}
