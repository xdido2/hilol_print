import 'package:local_source/local_source.dart';

import '../../../../../core/auth/auth_session_notifier.dart';

abstract interface class AuthLocalDataSource {
  const AuthLocalDataSource();

  bool get isAuthenticated;
  String get currentUserId;
  Future<void> saveSession({required String userId, required String accessToken, required String refreshToken});
  Future<void> clearSession();
}

final class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl({required LocalSource localSource, required AuthSessionNotifier authSessionNotifier})
    : _localSource = localSource,
      _authSessionNotifier = authSessionNotifier;

  final LocalSource _localSource;
  final AuthSessionNotifier _authSessionNotifier;

  @override
  bool get isAuthenticated => _localSource.isUserAuthenticated;

  @override
  String get currentUserId => _localSource.userID;

  @override
  Future<void> saveSession({required String userId, required String accessToken, required String refreshToken}) async {
    await _localSource.setUserID(userId);
    await _localSource.setAccessToken(accessToken);
    await _localSource.setRefreshToken(refreshToken);
    _authSessionNotifier.notifySessionChanged();
  }

  @override
  Future<void> clearSession() async {
    await _localSource.clearAll();
    _authSessionNotifier.notifySessionChanged();
  }
}
