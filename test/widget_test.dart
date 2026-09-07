import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hilol_print/src/core/app/app.dart';
import 'package:hilol_print/src/core/di/injection.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await sl.reset();
    SharedPreferences.setMockInitialValues(const <String, Object>{});
    await setupLocator();
  });

  testWidgets('App builds', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.pump(const Duration(seconds: 6));
    await tester.pumpAndSettle();
    expect(find.byType(App), findsOneWidget);
  });
}
