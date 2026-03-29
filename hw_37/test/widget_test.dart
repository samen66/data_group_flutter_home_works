import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hw_37/core/data/demo_api_client.dart';
import 'package:hw_37/core/di/service_locator.dart';
import 'package:hw_37/features/home/domain/user_profile_repository.dart';
import 'package:hw_37/core/status/status_widget_factory.dart';
import 'package:hw_37/core/status/ui_request_status.dart';
import 'package:hw_37/main.dart';

void main() {
  setUp(() async {
    await resetServiceLocatorForTest();
    configureServiceLocator();
  });

  testWidgets('Hw37App shows loading then success', (WidgetTester tester) async {
    await tester.pumpWidget(const Hw37App());
    expect(find.text('Loading…'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();

    expect(find.textContaining('Demo User'), findsOneWidget);
  });

  testWidgets('StatusWidgetFactory shows error message', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatusWidgetFactory.build(
            UiRequestStatus.error,
            message: 'Network down',
          ),
        ),
      ),
    );
    expect(find.text('Network down'), findsOneWidget);
  });

  test('GetIt returns same DemoApiClient when resolved twice', () {
    final a = sl<DemoApiClient>();
    final b = sl<DemoApiClient>();
    expect(identical(a, b), isTrue);
  });

  test('GetIt returns same UserProfileRepository when resolved twice', () {
    final a = sl<UserProfileRepository>();
    final b = sl<UserProfileRepository>();
    expect(identical(a, b), isTrue);
  });
}
