abstract class ApiClient {
  Future<String> login({
    required String username,
    required String password,
  });

  Future<List<Map<String, dynamic>>> getItems({
    required String token,
  });

  Future<Map<String, dynamic>> addItem({
    required String token,
    required String title,
  });

  Future<void> logout({
    required String token,
  });
}

abstract class LocalDb {
  Future<void> saveToken(String token);

  Future<String?> readToken();

  Future<void> clear();
}
