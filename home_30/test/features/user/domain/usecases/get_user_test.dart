import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:home_30/core/error/failures.dart';
import 'package:home_30/core/network/api_client.dart';
import 'package:home_30/features/user/data/models/user_model.dart';
import 'package:home_30/features/user/data/repositories/user_repository_impl.dart';
import 'package:home_30/features/user/domain/entities/user.dart';
import 'package:home_30/features/user/domain/usecases/get_user.dart';

import 'get_user_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late GetUser useCase;
  late MockApiClient mockApiClient;
  late UserRepositoryImpl repository;
  late GetIt getIt;

  setUp(() {
    // Создаем новый экземпляр GetIt для каждого теста
    getIt = GetIt.instance;
    if (getIt.isRegistered<ApiClient>()) {
      getIt.unregister<ApiClient>();
    }

    // Создаем мок ApiClient
    mockApiClient = MockApiClient();

    // Регистрируем мок в GetIt
    getIt.registerLazySingleton<ApiClient>(() => mockApiClient);

    // Создаем репозиторий с моковым ApiClient
    repository = UserRepositoryImpl(apiClient: getIt<ApiClient>());

    // Создаем use case
    useCase = GetUser(repository);
  });

  tearDown(() {
    // Очищаем GetIt после каждого теста
    if (getIt.isRegistered<ApiClient>()) {
      getIt.unregister<ApiClient>();
    }
  });

  const tUserId = 1;
  final tUserModel = UserModel(
    id: 1,
    name: 'Test User',
    username: 'testuser',
    email: 'test@example.com',
  );
  final tUser = tUserModel;

  test(
    'should return User when repository call is successful',
    () async {
      // Arrange
      when(mockApiClient.get('/users/$tUserId')).thenAnswer(
        (_) async => {
          'id': tUserModel.id,
          'name': tUserModel.name,
          'username': tUserModel.username,
          'email': tUserModel.email,
        },
      );

      // Act
      final result = await useCase(tUserId);

      // Assert
      expect(result, Right(tUser));
      verify(mockApiClient.get('/users/$tUserId')).called(1);
      verifyNoMoreInteractions(mockApiClient);
    },
  );

  test(
    'should return ServerFailure when repository call fails',
    () async {
      // Arrange
      when(mockApiClient.get('/users/$tUserId')).thenThrow(
        Exception('Network error'),
      );

      // Act
      final result = await useCase(tUserId);

      // Assert
      expect(result, isA<Left<Failure, User>>());
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (user) => fail('should have returned failure'),
      );
      verify(mockApiClient.get('/users/$tUserId')).called(1);
      verifyNoMoreInteractions(mockApiClient);
    },
  );
}
