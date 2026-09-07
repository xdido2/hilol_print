import 'package:flutter_test/flutter_test.dart';
import 'package:hilol_print/src/features/card/domain/repository/card_scanner_repository.dart';
import 'package:hilol_print/src/features/card/domain/usecase/open_app_settings_use_case.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardScannerRepository extends Mock implements CardScannerRepository {}

void main() {
  test('OpenAppSettingsUseCase delegates to the repository', () async {
    final repository = _MockCardScannerRepository();
    when(() => repository.openAppSettings()).thenAnswer((_) async {});

    await OpenAppSettingsUseCase(cardScannerRepository: repository)();

    verify(() => repository.openAppSettings()).called(1);
  });
}
