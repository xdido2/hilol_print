import 'user_entity.dart';

final class AuthSessionEntity {
  const AuthSessionEntity({required this.accessToken, required this.refreshToken, required this.user});

  final String accessToken;
  final String refreshToken;
  final UserEntity user;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthSessionEntity &&
          runtimeType == other.runtimeType &&
          accessToken == other.accessToken &&
          refreshToken == other.refreshToken &&
          user == other.user;

  @override
  int get hashCode => accessToken.hashCode ^ refreshToken.hashCode ^ user.hashCode;
}
