/// A card read over NFC.
///
/// Unlike [CardScanEntity] every field is filled in one go: an EMV read either
/// yields a complete record set or it fails, so there is nothing to merge
/// across attempts.
final class NfcCardEntity {
  const NfcCardEntity({required this.panNumber, required this.expiry, this.holderName});

  /// PAN, digits only.
  final String panNumber;

  /// Expiry formatted as `MMYY`, matching [CardScanEntity.expiry] so both
  /// sources feed the same input formatter.
  final String expiry;

  /// Cardholder name from EMV tag `0x5F20`. Most Humo / Uzcard records leave
  /// it out, hence the nullability.
  final String? holderName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NfcCardEntity &&
          runtimeType == other.runtimeType &&
          panNumber == other.panNumber &&
          expiry == other.expiry &&
          holderName == other.holderName;

  @override
  int get hashCode => Object.hash(panNumber, expiry, holderName);
}
