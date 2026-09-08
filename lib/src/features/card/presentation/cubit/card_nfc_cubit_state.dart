import 'package:flutter/foundation.dart';

import '../../../../common/data/enums/bloc_status_enum.dart';
import '../../domain/entity/nfc_card_entity.dart';

@immutable
final class CardNfcCubitState {
  const CardNfcCubitState({this.status = Status.initial, this.card, this.errorMessage});

  final Status status;

  /// `null` until an EMV read has completed.
  final NfcCardEntity? card;

  final String? errorMessage;

  bool get isRead => card != null;

  CardNfcCubitState copyWith({Status? status, NfcCardEntity? card, String? errorMessage}) => CardNfcCubitState(
    status: status ?? this.status,
    card: card ?? this.card,
    errorMessage: errorMessage,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardNfcCubitState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          card == other.card &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => Object.hash(status, card, errorMessage);
}
