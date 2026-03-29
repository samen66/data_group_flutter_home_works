import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hw_37/core/analytics/analytics_service.dart';
import 'package:hw_37/core/data/demo_api_client.dart';
import 'package:hw_37/core/logging/app_logger.dart';
import 'package:hw_37/features/home/data/demo_user_profile_repository.dart';
import 'package:hw_37/features/home/domain/user_profile_repository.dart';

final GetIt sl = GetIt.instance;

/// Alternative to direct `X.instance`: resolve the same singletons from a container.
///
/// See README: comparison with manual singletons.
void configureServiceLocator() {
  if (!sl.isRegistered<AppLogger>()) {
    sl.registerSingleton<AppLogger>(AppLogger.instance);
  }
  if (!sl.isRegistered<AnalyticsService>()) {
    sl.registerSingleton<AnalyticsService>(AnalyticsService.instance);
  }
  sl.registerLazySingleton<DemoApiClient>(DemoApiClient.new);
  if (!sl.isRegistered<UserProfileRepository>()) {
    sl.registerLazySingleton<UserProfileRepository>(
      () => DemoUserProfileRepository(sl<DemoApiClient>()),
    );
  }
}

/// Call in tests that use [sl].
@visibleForTesting
Future<void> resetServiceLocatorForTest() async {
  await sl.reset();
}
