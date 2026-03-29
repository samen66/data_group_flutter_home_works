import 'package:flutter_test/flutter_test.dart';
import 'package:hw_35/core/task_service.dart';

void main() {
  group('TaskService', () {
    test('loadTasks returns empty list initially', () async {
      final s = TaskService();
      final list = await s.loadTasks();
      expect(list, isEmpty);
    });

    test('addTask then loadTasks returns the task', () async {
      final s = TaskService();
      await s.addTask('Купить молоко');
      final list = await s.loadTasks();
      expect(list, hasLength(1));
      expect(list.single.title, 'Купить молоко');
    });

    test('addTask with empty title throws', () async {
      final s = TaskService();
      await expectLater(
        s.addTask('   '),
        throwsA(isA<TaskServiceException>()),
      );
    });

    test('loadTasks fails when failNextLoad is set', () async {
      final s = TaskService();
      s.failNextLoad = true;
      expect(s.loadTasks(), throwsA(isA<TaskServiceException>()));
    });
  });
}
