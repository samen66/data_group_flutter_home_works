import 'package:flutter_test/flutter_test.dart';

import 'package:hw_40/main.dart';

class FakeTodoRepository implements TodoRepository {
  FakeTodoRepository({
    this.items = const [],
    this.shouldThrow = false,
    this.delay = Duration.zero,
  });

  final List<TodoItem> items;
  final bool shouldThrow;
  final Duration delay;

  @override
  Future<List<TodoItem>> fetchTodos() async {
    await Future<void>.delayed(delay);
    if (shouldThrow) {
      throw Exception('fetch error');
    }
    return items;
  }
}

void main() {
  testWidgets('список: loading -> empty состояние', (WidgetTester tester) async {
    await tester.pumpWidget(
      MyApp(
        repository: FakeTodoRepository(delay: const Duration(milliseconds: 100)),
      ),
    );

    expect(find.byKey(AppKeys.loading), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.byKey(AppKeys.emptyState), findsOneWidget);
  });

  testWidgets('список: loading -> элементы', (WidgetTester tester) async {
    await tester.pumpWidget(
      MyApp(
        repository: FakeTodoRepository(
          delay: const Duration(milliseconds: 100),
          items: const [
            TodoItem(id: '1', title: 'Первая задача'),
            TodoItem(id: '2', title: 'Вторая задача'),
          ],
        ),
      ),
    );

    expect(find.byKey(AppKeys.loading), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.byKey(AppKeys.todoList), findsOneWidget);
    expect(find.text('Первая задача'), findsOneWidget);
    expect(find.text('Вторая задача'), findsOneWidget);
  });

  testWidgets('кнопка добавления: ввод -> тап -> элемент в списке', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MyApp(repository: FakeTodoRepository()));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(AppKeys.addInput), 'Новая задача');
    await tester.tap(find.byKey(AppKeys.addButton));
    await tester.pump();

    expect(find.text('Новая задача'), findsOneWidget);
  });

  testWidgets('ошибка загрузки: показывается SnackBar и Text', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MyApp(
        repository: FakeTodoRepository(
          shouldThrow: true,
          delay: const Duration(milliseconds: 100),
        ),
      ),
    );

    expect(find.byKey(AppKeys.loading), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.byKey(AppKeys.errorText), findsOneWidget);
    expect(find.byKey(AppKeys.snackBarText), findsOneWidget);
  });

  testWidgets('навигация: тап по элементу открывает детали', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MyApp(
        repository: FakeTodoRepository(
          items: const [TodoItem(id: '1', title: 'Задача для деталей')],
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(AppKeys.todoItem('1')));
    await tester.pumpAndSettle();

    expect(find.text('Детали'), findsOneWidget);
    expect(find.text('Задача для деталей'), findsOneWidget);
  });
}
