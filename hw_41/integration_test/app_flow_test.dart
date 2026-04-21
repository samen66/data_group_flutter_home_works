import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hw_41/main.dart';
import 'package:hw_41/src/app_dependencies.dart';
import 'package:hw_41/src/data/app_repository.dart';
import 'package:hw_41/src/data/fake_api_client.dart';
import 'package:hw_41/src/data/in_memory_db.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('login -> list -> add -> logout flow', (WidgetTester tester) async {
    final AppDependencies dependencies = AppDependencies(
      repository: AppRepository(
        apiClient: FakeApiClient(),
        localDb: InMemoryDb(),
      ),
    );

    await tester.pumpWidget(
      MyApp(
        dependencies: dependencies,
        appTitle: 'Homework 41 Integration',
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('login_button')), findsOneWidget);
    expect(find.text('First item'), findsNothing);

    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('items_list')), findsOneWidget);
    expect(find.text('First item'), findsOneWidget);
    expect(find.text('Second item'), findsOneWidget);

    await tester.tap(find.byKey(const Key('add_button')));
    await tester.pumpAndSettle();

    expect(find.text('New item'), findsOneWidget);

    await tester.tap(find.byKey(const Key('logout_button')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('login_button')), findsOneWidget);
    expect(find.text('Logged out'), findsOneWidget);
    expect(find.text('New item'), findsNothing);
  });
}
