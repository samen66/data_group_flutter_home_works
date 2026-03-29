import 'package:flutter/foundation.dart';

/// Central place for analytics events; single instance for the whole app.
class AnalyticsService {
  AnalyticsService._() {
    _constructionCount++;
  }

  static int _constructionCount = 0;

  @visibleForTesting
  static int get constructionCountForTest => _constructionCount;

  static final AnalyticsService instance = AnalyticsService._();

  final List<Map<String, Object?>> _events = [];

  /// Recorded events (useful in tests).
  @visibleForTesting
  List<Map<String, Object?>> get eventsForTest => List.unmodifiable(_events);

  @visibleForTesting
  void clearEventsForTest() {
    _events.clear();
  }

  void track(String name, [Map<String, Object?>? parameters]) {
    _events.add({
      'name': name,
      ...(parameters != null ? {'params': parameters} : const <String, Object?>{}),
    });
  }
}
