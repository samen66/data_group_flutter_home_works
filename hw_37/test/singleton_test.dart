import 'package:flutter_test/flutter_test.dart';
import 'package:hw_37/core/analytics/analytics_service.dart';
import 'package:hw_37/core/logging/app_logger.dart';

void main() {
  group('Singletons are not constructed twice', () {
    test('AppLogger.instance returns the same instance', () {
      final a = AppLogger.instance;
      final b = AppLogger.instance;
      final c = AppLogger.instance;

      expect(identical(a, b), isTrue);
      expect(identical(b, c), isTrue);
      expect(AppLogger.constructionCountForTest, 1);
    });

    test('AnalyticsService.instance returns the same instance', () {
      final a = AnalyticsService.instance;
      final b = AnalyticsService.instance;

      expect(identical(a, b), isTrue);
      expect(AnalyticsService.constructionCountForTest, 1);
    });
  });
}
