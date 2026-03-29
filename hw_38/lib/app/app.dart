import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/adapters/note_adapter.dart';
import '../data/datasources/notes_local_datasource.dart';
import '../data/datasources/notes_remote_datasource.dart';
import '../data/repositories/notes_repository_impl.dart';
import '../domain/repositories/notes_repository.dart';
import 'data_policy_store.dart';
import 'notes_feed_controller.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/settings_page.dart';
import 'pages/shell_page.dart';

class Hw38App extends StatelessWidget {
  const Hw38App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HW38 — Clean architecture',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const _Bootstrap(),
    );
  }
}

class _Bootstrap extends StatefulWidget {
  const _Bootstrap();

  @override
  State<_Bootstrap> createState() => _BootstrapState();
}

class _BootstrapState extends State<_Bootstrap> {
  late final Future<_AppDeps> _deps = _AppDeps.load();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<_AppDeps>(
      future: _deps,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Init failed: ${snapshot.error}')),
          );
        }
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        final d = snapshot.data!;
        return MultiProvider(
          providers: [
            Provider<NotesRepository>.value(value: d.repository),
            Provider<DataPolicyStore>.value(value: d.policyStore),
            ChangeNotifierProvider(
              create: (_) {
                final c = NotesFeedController(d.repository);
                c.start();
                return c;
              },
            ),
          ],
          child: ShellPage(
            items: [
              ShellItem(
                label: 'Home',
                icon: Icons.home_outlined,
                builder: (_) => const HomePage(),
              ),
              ShellItem(
                label: 'Profile',
                icon: Icons.person_outline,
                builder: (_) => const ProfilePage(),
              ),
              ShellItem(
                label: 'Settings',
                icon: Icons.settings_outlined,
                builder: (_) => const SettingsPage(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AppDeps {
  _AppDeps({
    required this.repository,
    required this.policyStore,
  });

  final NotesRepository repository;
  final DataPolicyStore policyStore;

  static Future<_AppDeps> load() async {
    final prefs = await SharedPreferences.getInstance();
    final policyStore = DataPolicyStore(prefs);
    final policy = policyStore.read();

    final repository = NotesRepositoryImpl(
      localDataSource: NotesLocalDataSourceImpl(prefs),
      remoteDataSource: NotesRemoteDataSourceImpl(),
      adapter: NoteAdapter(),
      initialPolicy: policy,
    );

    return _AppDeps(repository: repository, policyStore: policyStore);
  }
}
