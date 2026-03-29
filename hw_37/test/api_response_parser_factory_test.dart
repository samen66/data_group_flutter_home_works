import 'package:flutter_test/flutter_test.dart';
import 'package:hw_37/core/api/api_response_parser_factory.dart';
import 'package:hw_37/core/api/parsed_api_result.dart';

void main() {
  group('ApiResponseParserFactory', () {
    test('parses user payload', () {
      final r = ApiResponseParserFactory.parse({
        'type': 'user',
        'id': 7,
        'display_name': 'Ada',
      });
      expect(r, isA<ParsedUser>());
      final u = r as ParsedUser;
      expect(u.id, 7);
      expect(u.displayName, 'Ada');
    });

    test('parses item_list with object items', () {
      final r = ApiResponseParserFactory.parse({
        'type': 'item_list',
        'items': [
          {'title': 'A'},
          {'title': 'B'},
        ],
      });
      expect(r, isA<ParsedItemList>());
      expect((r as ParsedItemList).titles, ['A', 'B']);
    });

    test('parses item_list with string items', () {
      final r = ApiResponseParserFactory.parse({
        'type': 'item_list',
        'items': ['x', 'y'],
      });
      expect((r as ParsedItemList).titles, ['x', 'y']);
    });

    test('parses error payload', () {
      final r = ApiResponseParserFactory.parse({
        'type': 'error',
        'code': 'E404',
        'message': 'Missing',
      });
      expect(r, isA<ParsedErrorPayload>());
      final e = r as ParsedErrorPayload;
      expect(e.code, 'E404');
      expect(e.message, 'Missing');
    });

    test('throws on unknown type', () {
      expect(
        () => ApiResponseParserFactory.parse({'type': 'unknown'}),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
