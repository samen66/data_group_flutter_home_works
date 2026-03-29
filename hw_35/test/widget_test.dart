import 'package:flutter_test/flutter_test.dart';

import 'package:hw_35/main.dart';

void main() {
  testWidgets('Home shows pattern choice', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.textContaining('MVC'), findsWidgets);
    expect(find.textContaining('MVP'), findsWidgets);
  });
}
