import 'package:hw_41/src/data/contracts.dart';

class InMemoryDb implements LocalDb {
  String? _token;

  @override
  Future<void> saveToken(String token) async {
    _token = token;
  }

  @override
  Future<String?> readToken() async => _token;

  @override
  Future<void> clear() async {
    _token = null;
  }
}
