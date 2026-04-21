class FakeServer {
  static const String loginResponseJson = '{"token":"fake-token-123"}';

  static const List<Map<String, dynamic>> initialItemsJson =
      <Map<String, dynamic>>[
    <String, dynamic>{'id': 1, 'title': 'First item'},
    <String, dynamic>{'id': 2, 'title': 'Second item'},
  ];
}
