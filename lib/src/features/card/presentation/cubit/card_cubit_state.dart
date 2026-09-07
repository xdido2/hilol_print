import 'package:flutter/foundation.dart';

import '../../../../common/data/enums/bloc_status_enum.dart';
import '../../domain/entity/card_entity.dart';

@immutable
final class CardCubitState {
  const CardCubitState({this.status = Status.initial, this.card, this.errorMessage});

  final Status status;
  final CardEntity? card;
  final String? errorMessage;

  CardCubitState copyWith({Status? status, CardEntity? card, String? errorMessage}) =>
      CardCubitState(status: status ?? this.status, card: card ?? this.card, errorMessage: errorMessage);
}
