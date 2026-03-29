import 'package:flutter/foundation.dart';

/// Application-wide logger as a lazy singleton (`instance` is created once).
class AppLogger {
  AppLogger._() {
    _constructionCount++;
  }

  static int _constructionCount = 0;

  /// How many times the private constructor ran — must stay `1` for a singleton.
  @visibleForTesting
  static int get constructionCountForTest => _constructionCount;

  static final AppLogger instance = AppLogger._();

  void debug(String message, [Object? error, StackTrace? stack]) {
    if (kDebugMode) {
      debugPrint('[DEBUG] $message');
      if (error != null) debugPrint('$error');
      if (stack != null) debugPrint('$stack');
    }
  }

  void info(String message) {
    if (kDebugMode) {
      debugPrint('[INFO] $message');
    }
  }

  void warn(String message) {
    if (kDebugMode) {
      debugPrint('[WARN] $message');
    }
  }
}
