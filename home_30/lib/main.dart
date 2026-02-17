import 'package:flutter/material.dart';
import 'core/di/injection_container.dart' as di;
import 'features/user/domain/usecases/get_user.dart';
import 'features/user/presentation/pages/user_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Асинхронная инициализация зависимостей (SharedPreferences, Firebase, etc.)
  await di.initDependencies();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Work 30',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Получаем UseCase через GetIt в фабрике
      home: UserPage(
        getUserUseCase: di.getIt<GetUser>(),
      ),
    );
  }
}
