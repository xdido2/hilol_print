import 'dart:convert';

import 'package:local_source/local_source.dart';

import '../../models/card_model.dart';

abstract interface class CardLocalDataSource {
  const CardLocalDataSource();

  Future<List<CardModel>> getCards();
  Future<void> addCard(CardModel card);
}

final class CardLocalDataSourceImpl implements CardLocalDataSource {
  const CardLocalDataSourceImpl({required LocalSource localSource}) : _localSource = localSource;

  final LocalSource _localSource;

  PreferenceEntry<String> get _cardsEntry => _localSource.stringEntry(key: 'card.saved_cards');

  @override
  Future<List<CardModel>> getCards() async {
    final raw = _cardsEntry.read();
    if (raw == null || raw.isEmpty) return const <CardModel>[];

    final decoded = jsonDecode(raw) as List<Object?>;
    return decoded.map((e) => CardModel.fromJson((e as Map<Object?, Object?>).cast<String, Object?>())).toList();
  }

  @override
  Future<void> addCard(CardModel card) async {
    final cards = await getCards();
    final updated = [...cards, card];
    await _cardsEntry.set(jsonEncode(updated.map((c) => c.toJson()).toList()));
  }
}
