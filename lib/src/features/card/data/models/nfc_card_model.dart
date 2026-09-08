import 'package:fintech_card_core/fintech_card_core.dart';

import '../../domain/entity/nfc_card_entity.dart';

/// DTO around [CardData], narrowed to the three fields the add-card form uses
/// and normalized to digits.
final class NfcCardModel {
  const NfcCardModel({required this.panNumber, required this.expiry, this.holderName});

  /// Returns `null` when the record set is unusable.
  ///
  /// [CardData.expiryDate] is nullable because the plugin shares the value
  /// object with its OCR path, which may complete on the PAN alone. An NFC read
  /// without an expiry cannot fill the form, so it is rejected here instead of
  /// leaking a half-filled entity into the domain.
  static NfcCardModel? fromCardData(CardData data) {
    final panNumber = _digits(data.pan);
    final expiry = _digits(data.expiryDate ?? '');
    if (panNumber.isEmpty || expiry.length != 4) return null;

    final holderName = data.cardholderName?.trim();

    return NfcCardModel(
      panNumber: panNumber,
      expiry: expiry,
      holderName: holderName == null || holderName.isEmpty ? null : holderName,
    );
  }

  final String panNumber;
  final String expiry;
  final String? holderName;

  /// The plugin hands the expiry over as `MM/YY`; the separator is dropped so
  /// the entity matches [CardScanEntity.expiry] and feeds the same formatter.
  static String _digits(String value) => value.replaceAll(RegExp(r'\D'), '');

  NfcCardEntity toEntity() => NfcCardEntity(panNumber: panNumber, expiry: expiry, holderName: holderName);
}
