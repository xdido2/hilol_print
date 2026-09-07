import '../../domain/entity/card_entity.dart';

final class CardModel {
  const CardModel({required this.panNumber, required this.cardExpire});

  final String panNumber;
  final String cardExpire;

  factory CardModel.fromJson(Map<String, Object?> json) =>
      CardModel(panNumber: (json['pan_number'] as String?) ?? '', cardExpire: (json['card_expire'] as String?) ?? '');

  factory CardModel.fromEntity(CardEntity entity) =>
      CardModel(panNumber: entity.panNumber, cardExpire: entity.cardExpire);

  Map<String, Object?> toJson() => <String, Object?>{'pan_number': panNumber, 'card_expire': cardExpire};

  CardEntity toEntity() => CardEntity(panNumber: panNumber, cardExpire: cardExpire);
}
