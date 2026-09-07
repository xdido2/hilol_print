import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hilol_print/src/features/card/data/datasources/local/card_scanner_data_source.dart';
import 'package:hilol_print/src/features/card/data/models/recognized_text_model.dart';
import 'package:hilol_print/src/features/card/data/repository/card_scanner_repository_impl.dart';
import 'package:hilol_print/src/features/card/domain/entity/camera_frame_entity.dart';
import 'package:hilol_print/src/features/card/domain/entity/camera_permission_status.dart';
import 'package:hilol_print/src/features/card/domain/error/card_exceptions.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

class _MockCardScannerDataSource extends Mock implements CardScannerDataSource {}

void main() {
  late _MockCardScannerDataSource dataSource;
  late CardScannerRepositoryImpl repository;

  final frame = CameraFrameEntity(
    bytes: Uint8List(0),
    width: 640,
    height: 480,
    bytesPerRow: 640,
    format: .bgra8888,
    rotationDegrees: 0,
  );

  setUpAll(() => registerFallbackValue(frame));

  setUp(() {
    dataSource = _MockCardScannerDataSource();
    repository = CardScannerRepositoryImpl(dataSource: dataSource);
  });

  group('CardScannerRepositoryImpl', () {
    group('requestCameraPermission', () {
      Future<CameraPermissionStatus> requestWith(PermissionStatus status) {
        when(() => dataSource.requestCameraPermission()).thenAnswer((_) async => status);
        return repository.requestCameraPermission();
      }

      test('maps granted to granted', () async {
        expect(await requestWith(.granted), CameraPermissionStatus.granted);
      });

      test('maps limited and provisional to granted', () async {
        expect(await requestWith(.limited), CameraPermissionStatus.granted);
        expect(await requestWith(.provisional), CameraPermissionStatus.granted);
      });

      test('maps denied to denied', () async {
        expect(await requestWith(.denied), CameraPermissionStatus.denied);
      });

      test('maps permanentlyDenied and restricted to permanentlyDenied', () async {
        expect(await requestWith(.permanentlyDenied), CameraPermissionStatus.permanentlyDenied);
        expect(await requestWith(.restricted), CameraPermissionStatus.permanentlyDenied);
      });
    });

    group('recognizeText', () {
      test('delegates to the data source and maps the model to an entity', () async {
        when(
          () => dataSource.recognizeText(any()),
        ).thenAnswer((_) async => const RecognizedTextModel(lines: <String>['8600 1234 5678 9012']));

        final result = await repository.recognizeText(frame);

        expect(result.lines, <String>['8600 1234 5678 9012']);
        verify(() => dataSource.recognizeText(frame)).called(1);
      });

      test('converts an infrastructure failure into a domain exception', () async {
        when(() => dataSource.recognizeText(any())).thenThrow(Exception('platform channel died'));

        expect(() => repository.recognizeText(frame), throwsA(isA<TextRecognitionException>()));
      });
    });

    test('openAppSettings delegates to the data source', () async {
      when(() => dataSource.openSettings()).thenAnswer((_) async => true);

      await repository.openAppSettings();

      verify(() => dataSource.openSettings()).called(1);
    });

    test('dispose delegates to the data source', () async {
      when(() => dataSource.dispose()).thenAnswer((_) async {});

      await repository.dispose();

      verify(() => dataSource.dispose()).called(1);
    });
  });
}
