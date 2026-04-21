import 'package:flutter_test/flutter_test.dart';
import 'package:hw_41/src/data/app_repository.dart';
import 'package:hw_41/src/data/contracts.dart';
import 'package:mocktail/mocktail.dart';

class MockApiClient extends Mock implements ApiClient {}

class MockLocalDb extends Mock implements LocalDb {}

void main() {
  late MockApiClient apiClient;
  late MockLocalDb localDb;
  late AppRepository repository;

  setUp(() {
    apiClient = MockApiClient();
    localDb = MockLocalDb();
    repository = AppRepository(apiClient: apiClient, localDb: localDb);
  });

  test('login saves token to local db', () async {
    when(
      () => apiClient.login(username: 'u', password: 'p'),
    ).thenAnswer((_) async => 'token-1');
    when(() => localDb.saveToken('token-1')).thenAnswer((_) async {});

    final String token = await repository.login(username: 'u', password: 'p');

    expect(token, 'token-1');
    verify(() => localDb.saveToken('token-1')).called(1);
  });

  test('getItems reads from API using saved token', () async {
    when(() => localDb.readToken()).thenAnswer((_) async => 'token-2');
    when(
      () => apiClient.getItems(token: 'token-2'),
    ).thenAnswer((_) async => <Map<String, dynamic>>[
          <String, dynamic>{'id': 1, 'title': 'Item A'},
          <String, dynamic>{'id': 2, 'title': 'Item B'},
        ]);

    final List<String> items = await repository.getItems();

    expect(items, <String>['Item A', 'Item B']);
    verify(() => apiClient.getItems(token: 'token-2')).called(1);
  });

  test('logout clears token and calls API', () async {
    when(() => localDb.readToken()).thenAnswer((_) async => 'token-3');
    when(() => apiClient.logout(token: 'token-3')).thenAnswer((_) async {});
    when(() => localDb.clear()).thenAnswer((_) async {});

    await repository.logout();

    verify(() => apiClient.logout(token: 'token-3')).called(1);
    verify(() => localDb.clear()).called(1);
  });
}
