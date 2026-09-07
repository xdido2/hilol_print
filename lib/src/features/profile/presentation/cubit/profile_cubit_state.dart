import 'package:flutter/foundation.dart';

import '../../../../common/data/enums/bloc_status_enum.dart';
import '../../domain/entities/profile_entity.dart';

@immutable
final class ProfileCubitState {
  const ProfileCubitState({this.status = Status.initial, this.profile, this.errorMessage});

  final Status status;
  final ProfileEntity? profile;
  final String? errorMessage;

  ProfileCubitState copyWith({Status? status, ProfileEntity? profile, String? errorMessage}) =>
      ProfileCubitState(status: status ?? this.status, profile: profile ?? this.profile, errorMessage: errorMessage);
}
