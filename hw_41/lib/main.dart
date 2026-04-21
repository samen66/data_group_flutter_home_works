import 'package:flutter/material.dart';
import 'package:hw_41/src/app_dependencies.dart';
import 'package:hw_41/src/data/app_repository.dart';
import 'package:hw_41/src/data/fake_api_client.dart';
import 'package:hw_41/src/data/in_memory_db.dart';

void main() {
  final AppDependencies dependencies = AppDependencies(
    repository: AppRepository(
      apiClient: FakeApiClient(),
      localDb: InMemoryDb(),
    ),
  );

  runApp(MyApp(dependencies: dependencies));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.dependencies, super.key});

  final AppDependencies dependencies;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework 41',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: HomeScreen(repository: dependencies.repository),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.repository, super.key});

  final AppRepository repository;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  bool _isAuthorized = false;
  String _status = 'Not logged in';
  List<String> _items = <String>[];

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    final String token = await widget.repository.login(
      username: 'demo',
      password: 'demo',
    );
    final List<String> items = await widget.repository.getItems();

    setState(() {
      _isAuthorized = true;
      _isLoading = false;
      _status = 'Token: $token';
      _items = items;
    });
  }

  Future<void> _addItem() async {
    setState(() {
      _isLoading = true;
    });

    final List<String> items = await widget.repository.addItem('New item');

    setState(() {
      _isLoading = false;
      _items = items;
    });
  }

  Future<void> _logout() async {
    setState(() {
      _isLoading = true;
    });

    await widget.repository.logout();

    setState(() {
      _isAuthorized = false;
      _isLoading = false;
      _status = 'Logged out';
      _items = <String>[];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Homework 41')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _status,
                key: const Key('status_text'),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              if (_isAuthorized)
                Expanded(
                  child: ListView.builder(
                    key: const Key('items_list'),
                    itemCount: _items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(_items[index]),
                      );
                    },
                  ),
                )
              else
                const SizedBox(
                  key: Key('items_placeholder'),
                  height: 80,
                ),
              const SizedBox(height: 12),
              if (_isLoading) const CircularProgressIndicator(),
              if (!_isLoading && !_isAuthorized)
                ElevatedButton(
                  key: const Key('login_button'),
                  onPressed: _login,
                  child: const Text('Login'),
                ),
              if (!_isLoading && _isAuthorized)
                Wrap(
                  spacing: 8,
                  children: <Widget>[
                    ElevatedButton(
                      key: const Key('add_button'),
                      onPressed: _addItem,
                      child: const Text('Add'),
                    ),
                    OutlinedButton(
                      key: const Key('logout_button'),
                      onPressed: _logout,
                      child: const Text('Logout'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
