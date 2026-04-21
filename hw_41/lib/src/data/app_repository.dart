import 'package:hw_41/src/data/contracts.dart';

class AppRepository {
  AppRepository({
    required ApiClient apiClient,
    required LocalDb localDb,
  })  : _apiClient = apiClient,
        _localDb = localDb;

  final ApiClient _apiClient;
  final LocalDb _localDb;

  Future<String> login({
    required String username,
    required String password,
  }) async {
    final String token = await _apiClient.login(
      username: username,
      password: password,
    );
    await _localDb.saveToken(token);
    return token;
  }

  Future<List<String>> getItems() async {
    final String token = await _requireToken();
    final List<Map<String, dynamic>> response = await _apiClient.getItems(
      token: token,
    );

    return response
        .map((Map<String, dynamic> item) => item['title'] as String)
        .toList();
  }

  Future<List<String>> addItem(String title) async {
    final String token = await _requireToken();
    await _apiClient.addItem(
      token: token,
      title: title,
    );
    return getItems();
  }

  Future<void> logout() async {
    final String? token = await _localDb.readToken();
    if (token != null) {
      await _apiClient.logout(token: token);
    }
    await _localDb.clear();
  }

  Future<String> _requireToken() async {
    final String? token = await _localDb.readToken();
    if (token == null) {
      throw StateError('User is not authenticated.');
    }
    return token;
  }
}
