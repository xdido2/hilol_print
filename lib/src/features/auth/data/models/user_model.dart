import '../../domain/entities/user_entity.dart';

final class UserModel {
  const UserModel({required this.id, required this.username});

  final String id;
  final String username;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      UserModel(id: (json['id'] as String?) ?? '', username: (json['username'] as String?) ?? '');

  Map<String, Object?> toJson() => <String, Object?>{'id': id, 'username': username};

  UserEntity toEntity() => UserEntity(id: id, username: username);
}
