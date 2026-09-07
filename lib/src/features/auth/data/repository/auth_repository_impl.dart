import '../../domain/entities/auth_session_entity.dart';
import '../../domain/error/auth_exceptions.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasources/local/auth_local_data_source.dart';
import '../models/user_model.dart';

/// Example credentials for the initial project template.
/// Username: `udevs`, Password: `1234`.
const String _kHardcodedUsername = 'udevs';
const String _kHardcodedPassword = '1234';

final class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required AuthLocalDataSource localDataSource}) : _localDataSource = localDataSource;

  final AuthLocalDataSource _localDataSource;

  @override
  bool get isAuthenticated => _localDataSource.isAuthenticated;

  @override
  Future<AuthSessionEntity> login({required String username, required String password}) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    if (username != _kHardcodedUsername || password != _kHardcodedPassword) {
      throw const InvalidCredentialsException();
    }
    final session = AuthSessionEntity(
      accessToken: 'demo-access-token',
      refreshToken: 'demo-refresh-token',
      user: const UserModel(id: 'demo-user', username: _kHardcodedUsername).toEntity(),
    );
    await saveSession(session);
    return session;
  }

  @override
  Future<void> saveSession(AuthSessionEntity session) => _localDataSource.saveSession(
    userId: session.user.id,
    accessToken: session.accessToken,
    refreshToken: session.refreshToken,
  );

  @override
  Future<void> logout() => _localDataSource.clearSession();
}
