import 'package:flutter/foundation.dart';

import '../../../../common/data/enums/bloc_status_enum.dart';
import '../../domain/entities/auth_session_entity.dart';

enum AuthAction { none, login, logout }

@immutable
final class AuthCubitState {
  const AuthCubitState({this.status = Status.initial, this.action = AuthAction.none, this.session, this.errorMessage});

  final Status status;
  final AuthAction action;
  final AuthSessionEntity? session;
  final String? errorMessage;

  AuthCubitState copyWith({Status? status, AuthAction? action, AuthSessionEntity? session, String? errorMessage}) =>
      AuthCubitState(
        status: status ?? this.status,
        action: action ?? this.action,
        session: session ?? this.session,
        errorMessage: errorMessage,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthCubitState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          action == other.action &&
          session == other.session &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => status.hashCode ^ action.hashCode ^ session.hashCode ^ errorMessage.hashCode;
}
