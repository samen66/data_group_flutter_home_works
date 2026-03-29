import 'dart:convert';

import 'package:hw_37/core/analytics/analytics_service.dart';
import 'package:hw_37/core/api/api_response_parser_factory.dart';
import 'package:hw_37/core/api/parsed_api_result.dart';
import 'package:hw_37/core/logging/app_logger.dart';

/// Simulates loading JSON from an API and parsing it via the parser factory.
class DemoApiClient {
  DemoApiClient();

  /// Fetches a user-shaped payload (for demo / homework).
  Future<ParsedApiResult> loadUserProfile() async {
    AppLogger.instance.info('DemoApiClient.loadUserProfile');
    AnalyticsService.instance.track('api_request', {'endpoint': 'profile'});

    await Future<void>.delayed(const Duration(milliseconds: 400));

    const raw = '''
    {"type":"user","id":42,"display_name":"Demo User"}
    ''';
    final map = jsonDecode(raw) as Map<String, dynamic>;
    final result = ApiResponseParserFactory.parse(map);

    AnalyticsService.instance.track('api_success', {'endpoint': 'profile'});
    AppLogger.instance.info('DemoApiClient: parsed ${result.runtimeType}');
    return result;
  }
}
