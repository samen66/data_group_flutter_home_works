import 'package:flutter/material.dart';
import 'package:hw_36/app.dart';
import 'package:hw_36/core/bootstrap/register_path_provider.dart';
import 'package:hw_36/core/di/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerPathProviderImplementations();
  await configureDependencies();
  runApp(const Hw36App());
}
