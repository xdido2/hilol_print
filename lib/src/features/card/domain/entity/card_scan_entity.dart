/// What a scan has recognized so far.
///
/// Both fields are optional because the PAN and the expiry rarely land in the
/// same frame — [mergeWith] accumulates them across frames.
final class CardScanEntity {
  const CardScanEntity({this.panNumber, this.expiry});

  /// Recognized PAN, digits only.
  final String? panNumber;

  /// Recognized expiry, formatted as `MMYY`.
  final String? expiry;

  bool get isComplete => panNumber != null && expiry != null;

  bool get isEmpty => panNumber == null && expiry == null;

  /// Keeps what is already recognized and fills the gaps from [other].
  CardScanEntity mergeWith(CardScanEntity other) =>
      CardScanEntity(panNumber: panNumber ?? other.panNumber, expiry: expiry ?? other.expiry);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardScanEntity &&
          runtimeType == other.runtimeType &&
          panNumber == other.panNumber &&
          expiry == other.expiry;

  @override
  int get hashCode => panNumber.hashCode ^ expiry.hashCode;
}
