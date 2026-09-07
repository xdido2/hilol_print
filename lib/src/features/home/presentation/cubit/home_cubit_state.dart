import 'package:flutter/foundation.dart';

import '../../../../common/data/enums/bloc_status_enum.dart';
import '../../domain/entities/home_item_entity.dart';

@immutable
final class HomeCubitState {
  const HomeCubitState({this.status = Status.initial, this.items = const <HomeItemEntity>[], this.errorMessage});

  final Status status;
  final List<HomeItemEntity> items;
  final String? errorMessage;

  HomeCubitState copyWith({Status? status, List<HomeItemEntity>? items, String? errorMessage}) =>
      HomeCubitState(status: status ?? this.status, items: items ?? this.items, errorMessage: errorMessage);
}
