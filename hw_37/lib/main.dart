import 'package:flutter/material.dart';
import 'package:hw_37/core/analytics/analytics_service.dart';
import 'package:hw_37/core/di/service_locator.dart';
import 'package:hw_37/core/logging/app_logger.dart';
import 'package:hw_37/features/home/domain/user_profile_repository.dart';
import 'package:hw_37/features/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureServiceLocator();

  AppLogger.instance.info('Application starting');
  AnalyticsService.instance.track('app_opened');

  runApp(const Hw37App());
}

class Hw37App extends StatelessWidget {
  const Hw37App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HW 37',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: HomePage(profileRepository: sl<UserProfileRepository>()),
    );
  }
}
