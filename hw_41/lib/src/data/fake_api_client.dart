import 'package:hw_41/src/data/contracts.dart';
import 'package:hw_41/src/data/fake_server.dart';

class FakeApiClient implements ApiClient {
  final List<Map<String, dynamic>> _items =
      List<Map<String, dynamic>>.from(FakeServer.initialItemsJson);

  int _nextId = 3;

  @override
  Future<String> login({
    required String username,
    required String password,
  }) async {
    return FakeServer.loginResponseJson;
  }

  @override
  Future<List<Map<String, dynamic>>> getItems({
    required String token,
  }) async {
    return List<Map<String, dynamic>>.from(_items);
  }

  @override
  Future<Map<String, dynamic>> addItem({
    required String token,
    required String title,
  }) async {
    final Map<String, dynamic> item = <String, dynamic>{
      'id': _nextId++,
      'title': title,
    };
    _items.add(item);
    return item;
  }

  @override
  Future<void> logout({
    required String token,
  }) async {}
}
