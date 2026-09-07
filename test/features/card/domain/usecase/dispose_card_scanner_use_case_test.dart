import 'package:flutter_test/flutter_test.dart';
import 'package:hilol_print/src/features/card/domain/repository/card_scanner_repository.dart';
import 'package:hilol_print/src/features/card/domain/usecase/dispose_card_scanner_use_case.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardScannerRepository extends Mock implements CardScannerRepository {}

void main() {
  test('DisposeCardScannerUseCase delegates to the repository', () async {
    final repository = _MockCardScannerRepository();
    when(() => repository.dispose()).thenAnswer((_) async {});

    await DisposeCardScannerUseCase(cardScannerRepository: repository)();

    verify(() => repository.dispose()).called(1);
  });
}
