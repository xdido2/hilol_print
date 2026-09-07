import '../../domain/entities/auth_session_entity.dart';
import 'user_model.dart';

final class AuthSessionModel {
  const AuthSessionModel({required this.accessToken, required this.refreshToken, required this.user});

  final String accessToken;
  final String refreshToken;
  final UserModel user;

  factory AuthSessionModel.fromJson(Map<String, Object?> json) => AuthSessionModel(
    accessToken: (json['access_token'] as String?) ?? '',
    refreshToken: (json['refresh_token'] as String?) ?? '',
    user: UserModel.fromJson(((json['user'] as Map?) ?? const <Object?, Object?>{}).cast<String, Object?>()),
  );

  Map<String, Object?> toJson() => <String, Object?>{
    'access_token': accessToken,
    'refresh_token': refreshToken,
    'user': user.toJson(),
  };

  AuthSessionEntity toEntity() =>
      AuthSessionEntity(accessToken: accessToken, refreshToken: refreshToken, user: user.toEntity());
}
