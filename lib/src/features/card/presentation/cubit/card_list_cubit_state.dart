import 'package:flutter/foundation.dart';

import '../../../../common/data/enums/bloc_status_enum.dart';
import '../../domain/entity/card_entity.dart';

@immutable
final class CardListCubitState {
  const CardListCubitState({this.status = Status.initial, this.cards = const <CardEntity>[], this.errorMessage});

  final Status status;
  final List<CardEntity> cards;
  final String? errorMessage;

  bool get hasCards => cards.isNotEmpty;

  CardListCubitState copyWith({Status? status, List<CardEntity>? cards, String? errorMessage}) => CardListCubitState(
    status: status ?? this.status,
    cards: cards ?? this.cards,
    errorMessage: errorMessage,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardListCubitState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          listEquals(cards, other.cards) &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => Object.hash(status, .hashAll(cards), errorMessage);
}
