import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/injection/injection.dart';
import 'core/bloc_observer/app_bloc_observer.dart';
import 'features/champions_league/presentation/pages/matches_page.dart';
import 'features/champions_league/presentation/bloc/matches_bloc.dart';
import 'features/champions_league/presentation/bloc/teams_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  await init();

  // Set up BlocObserver for logging
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Champions League',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<MatchesBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<TeamsBloc>(),
          ),
        ],
        child: const MatchesPage(),
      ),
    );
  }
}
