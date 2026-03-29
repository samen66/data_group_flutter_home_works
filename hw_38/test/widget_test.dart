import 'package:flutter_test/flutter_test.dart';
import 'package:hw_38/app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Hw38App loads shell after bootstrap', (tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const Hw38App());
    await tester.pump();
    expect(find.byType(Hw38App), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.text('Home'), findsWidgets);
  });
}
