import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hw_41/main.dart';
import 'package:hw_41/src/app_dependencies.dart';
import 'package:hw_41/src/data/app_repository.dart';
import 'package:hw_41/src/data/fake_api_client.dart';
import 'package:hw_41/src/data/in_memory_db.dart';

void main() {
  testWidgets('renders login button with test DI', (WidgetTester tester) async {
    final AppDependencies testDependencies = AppDependencies(
      repository: AppRepository(
        apiClient: FakeApiClient(),
        localDb: InMemoryDb(),
      ),
    );

    await tester.pumpWidget(
      MyApp(
        dependencies: testDependencies,
        appTitle: 'Homework 41 Test',
      ),
    );

    expect(find.byKey(const Key('login_button')), findsOneWidget);
    expect(find.byKey(const Key('items_list')), findsNothing);
  });
}
