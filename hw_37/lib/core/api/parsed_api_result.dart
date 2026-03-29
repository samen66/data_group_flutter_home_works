import 'api_payload_kind.dart';

sealed class ParsedApiResult {
  const ParsedApiResult();
}

class ParsedUser extends ParsedApiResult {
  const ParsedUser({required this.id, required this.displayName});

  final int id;
  final String displayName;
}

class ParsedItemList extends ParsedApiResult {
  const ParsedItemList(this.titles);

  final List<String> titles;
}

class ParsedErrorPayload extends ParsedApiResult {
  const ParsedErrorPayload(this.code, this.message);

  final String code;
  final String message;
}

/// Maps wire `type` string to [ApiPayloadKind].
ApiPayloadKind? apiPayloadKindFromJson(String? raw) {
  switch (raw) {
    case 'user':
      return ApiPayloadKind.user;
    case 'item_list':
      return ApiPayloadKind.itemList;
    case 'error':
      return ApiPayloadKind.error;
    default:
      return null;
  }
}
