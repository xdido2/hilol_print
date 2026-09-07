final class CardEntity {
  const CardEntity({required this.panNumber, required this.cardExpire});

  final String panNumber;
  final String cardExpire;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardEntity &&
          runtimeType == other.runtimeType &&
          panNumber == other.panNumber &&
          cardExpire == other.cardExpire;

  @override
  int get hashCode => panNumber.hashCode ^ cardExpire.hashCode;
}
