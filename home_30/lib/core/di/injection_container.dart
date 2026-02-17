import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import '../network/api_client.dart';
import '../../features/user/data/repositories/user_repository_impl.dart';
import '../../features/user/domain/repositories/user_repository.dart';
import '../../features/user/domain/usecases/get_user.dart';

final getIt = GetIt.instance;

/// Initialize all dependencies
Future<void> initDependencies() async {
  // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Register HTTP client
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  // Register ApiClient - switch between Mock and Real based on debug mode
  if (kDebugMode) {
    // Use MockApiClient in debug mode
    getIt.registerLazySingleton<ApiClient>(() => MockApiClient());
  } else {
    // Use RealApiClient in release mode
    getIt.registerLazySingleton<ApiClient>(
      () => RealApiClient(client: getIt()),
    );
  }

  // Register Repository
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(apiClient: getIt()),
  );

  // Register Use Cases
  getIt.registerLazySingleton(() => GetUser(getIt()));
}
