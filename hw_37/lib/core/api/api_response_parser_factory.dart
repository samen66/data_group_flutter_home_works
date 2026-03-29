import 'package:hw_37/core/logging/app_logger.dart';

import 'api_payload_kind.dart';
import 'parsed_api_result.dart';

/// Factory: selects parsing strategy by API `type` field.
class ApiResponseParserFactory {
  const ApiResponseParserFactory._();

  static ParsedApiResult parse(Map<String, dynamic> json) {
    final kind = apiPayloadKindFromJson(json['type'] as String?);
    AppLogger.instance.debug('ApiResponseParserFactory.parse kind=$kind');

    switch (kind) {
      case ApiPayloadKind.user:
        return _parseUser(json);
      case ApiPayloadKind.itemList:
        return _parseItemList(json);
      case ApiPayloadKind.error:
        return _parseError(json);
      case null:
        throw FormatException('Unknown or missing API type: ${json['type']}');
    }
  }

  static ParsedUser _parseUser(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['display_name'] ?? json['name'];
    if (id is! int || name is! String) {
      throw FormatException('Invalid user payload');
    }
    return ParsedUser(id: id, displayName: name);
  }

  static ParsedItemList _parseItemList(Map<String, dynamic> json) {
    final raw = json['items'];
    if (raw is! List) {
      throw FormatException('Invalid item_list payload');
    }
    final titles = raw.map((e) {
      if (e is Map && e['title'] is String) return e['title'] as String;
      if (e is String) return e;
      throw FormatException('Invalid list item');
    }).toList();
    return ParsedItemList(List<String>.from(titles));
  }

  static ParsedErrorPayload _parseError(Map<String, dynamic> json) {
    final code = json['code'];
    final message = json['message'];
    if (code is! String || message is! String) {
      throw FormatException('Invalid error payload');
    }
    return ParsedErrorPayload(code, message);
  }
}
