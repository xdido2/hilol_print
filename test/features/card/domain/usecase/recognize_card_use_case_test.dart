import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hilol_print/src/features/card/domain/entity/camera_frame_entity.dart';
import 'package:hilol_print/src/features/card/domain/entity/card_scan_entity.dart';
import 'package:hilol_print/src/features/card/domain/entity/recognized_text_entity.dart';
import 'package:hilol_print/src/features/card/domain/repository/card_scanner_repository.dart';
import 'package:hilol_print/src/features/card/domain/usecase/recognize_card_use_case.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardScannerRepository extends Mock implements CardScannerRepository {}

void main() {
  late _MockCardScannerRepository repository;
  late RecognizeCardUseCase useCase;

  final frame = CameraFrameEntity(
    bytes: Uint8List(0),
    width: 1280,
    height: 720,
    bytesPerRow: 1280,
    format: .nv21,
    rotationDegrees: 90,
  );

  /// Fixed so the expiry plausibility window does not drift with the clock.
  DateTime fixedNow() => DateTime(2026, 9, 5);

  setUpAll(() => registerFallbackValue(frame));

  setUp(() {
    repository = _MockCardScannerRepository();
    useCase = RecognizeCardUseCase(cardScannerRepository: repository, now: fixedNow);
  });

  Future<CardScanEntity> run(List<String> lines) {
    when(() => repository.recognizeText(any())).thenAnswer((_) async => RecognizedTextEntity(lines: lines));
    return useCase(frame);
  }

  group('RecognizeCardUseCase', () {
    test('delegates the frame to the repository', () async {
      await run(const <String>[]);

      verify(() => repository.recognizeText(frame)).called(1);
    });

    test('returns nothing when the frame yielded no text', () async {
      final result = await run(const <String>[]);

      expect(result.isEmpty, isTrue);
    });

    test('reads a grouped PAN and an expiry off separate lines', () async {
      final result = await run(const <String>['8600 1234 5678 9012', 'VALID THRU  12/28']);

      expect(result.panNumber, '8600123456789012');
      expect(result.expiry, '1228');
      expect(result.isComplete, isTrue);
    });

    test('accepts a Luhn-valid PAN from any scheme', () async {
      final result = await run(const <String>['4111 1111 1111 1111']);

      expect(result.panNumber, '4111111111111111');
    });

    test('accepts a local-BIN PAN that fails the Luhn checksum', () async {
      final result = await run(const <String>['9860 1234 5678 9013']);

      expect(result.panNumber, '9860123456789013');
    });

    test('rejects sixteen digits that are neither Luhn-valid nor a local BIN', () async {
      final result = await run(const <String>['1234 5678 9012 3456']);

      expect(result.panNumber, isNull);
    });

    test('ignores digit runs that are not exactly sixteen long', () async {
      final result = await run(const <String>['860012345678901', '86001234567890123']);

      expect(result.panNumber, isNull);
    });

    test('reads a PAN printed without separators', () async {
      final result = await run(const <String>['8600123456789012']);

      expect(result.panNumber, '8600123456789012');
    });

    test('prefers a Luhn-valid candidate over a local-BIN one', () async {
      final result = await run(const <String>['9860 1234 5678 9013', '4111 1111 1111 1111']);

      expect(result.panNumber, '4111111111111111');
    });

    test('picks the later date when the card prints both issue and expiry', () async {
      final result = await run(const <String>['FROM 03/24  THRU 11/29']);

      expect(result.expiry, '1129');
    });

    test('ignores a date further ahead than a card can be valid', () async {
      final result = await run(const <String>['12/99']);

      expect(result.expiry, isNull);
    });

    test('ignores a date too far in the past to be a printed expiry', () async {
      final result = await run(const <String>['05/10']);

      expect(result.expiry, isNull);
    });

    test('still reads an expiry that has recently passed', () async {
      final result = await run(const <String>['01/25']);

      expect(result.expiry, '0125');
    });

    test('does not mistake a month above twelve for an expiry', () async {
      final result = await run(const <String>['13/28']);

      expect(result.expiry, isNull);
    });

    test('does not read an expiry out of the PAN groups', () async {
      final result = await run(const <String>['8600 1234 5678 9012']);

      expect(result.expiry, isNull);
    });

    test('returns a partial result when only the PAN is legible', () async {
      final result = await run(const <String>['8600 1234 5678 9012', 'CARDHOLDER NAME']);

      expect(result.panNumber, '8600123456789012');
      expect(result.expiry, isNull);
      expect(result.isComplete, isFalse);
    });
  });
}
