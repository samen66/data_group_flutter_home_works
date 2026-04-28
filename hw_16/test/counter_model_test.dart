import 'package:flutter_test/flutter_test.dart';
import 'package:hw_16/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CounterModel', () {
    test('loadCounter returns 0 when no value exists', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{});

      final CounterModel model = CounterModel();
      final int value = await model.loadCounter();

      expect(value, 0);
      expect(model.counter, 0);
    });

    test('increment saves and next instance loads latest value', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{});

      final CounterModel first = CounterModel();
      await first.loadCounter();
      await first.increment();
      await first.increment();
      await first.increment();

      final CounterModel second = CounterModel();
      final int restoredValue = await second.loadCounter();

      expect(restoredValue, 3);
      expect(second.counter, 3);
    });
  });
}
