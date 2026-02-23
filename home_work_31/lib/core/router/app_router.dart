import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/products/presentation/pages/products_list_page.dart';
import '../../features/products/presentation/pages/product_detail_page.dart';
import '../../features/products/data/datasources/products_remote_datasource.dart';
import '../../features/products/data/repositories/products_repository_impl.dart';
import '../../features/products/domain/repositories/products_repository.dart';
import '../../core/di/injection_container.dart';
import '../../core/storage/secure_storage_service.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const ProductsListPage(),
      ),
      GoRoute(
        path: '/products',
        builder: (context, state) => const ProductsListPage(),
      ),
      GoRoute(
        path: '/products/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          // В реальном приложении здесь будет загрузка продукта по ID
          // Для демо используем первый продукт из списка
          return FutureBuilder(
            future: _loadProductById(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }
              if (snapshot.hasData) {
                return ProductDetailPage(product: snapshot.data!);
              }
              return Scaffold(
                appBar: AppBar(title: const Text('Product Not Found')),
                body: const Center(child: Text('Product not found')),
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) {
          final locale = state.uri.queryParameters['locale'] ?? 'en';
          return SettingsPage(initialLocale: locale);
        },
      ),
    ],
  );

  static Future<dynamic> _loadProductById(String id) async {
    final repository = ProductsRepositoryImpl(
      remoteDataSource: ProductsRemoteDataSourceImpl(),
    );
    final result = await repository.getProducts();
    return result.fold(
      (failure) => null,
      (products) => products.firstWhere(
        (p) => p.id == id,
        orElse: () => products.first,
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  final String initialLocale;

  const SettingsPage({super.key, required this.initialLocale});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late String _selectedLocale;

  @override
  void initState() {
    super.initState();
    _selectedLocale = widget.initialLocale;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Language',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  RadioListTile<String>(
                    title: const Text('English'),
                    value: 'en',
                    groupValue: _selectedLocale,
                    onChanged: (value) {
                      setState(() {
                        _selectedLocale = value!;
                      });
                      // In a real app, you would save the locale preference
                      // and update MaterialApp locale using a state management solution
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Русский'),
                    value: 'ru',
                    groupValue: _selectedLocale,
                    onChanged: (value) {
                      setState(() {
                        _selectedLocale = value!;
                      });
                      // In a real app, you would save the locale preference
                      // and update MaterialApp locale using a state management solution
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Token Management',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  FutureBuilder(
                    future: getIt<SecureStorageService>().getToken(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final tokenResult = snapshot.data!;
                        return tokenResult.fold(
                          (failure) => Text('Error: ${failure.message}'),
                          (token) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Token: ${token ?? "Not set"}'),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () async {
                                  const demoToken = 'demo_token_12345';
                                  final result = await getIt<SecureStorageService>()
                                      .saveToken(demoToken);
                                  result.fold(
                                    (failure) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      SnackBar(content: Text(failure.message)),
                                    ),
                                    (_) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content: Text('Token saved successfully'),
                                      ),
                                    ),
                                  );
                                  setState(() {});
                                },
                                child: const Text('Save Demo Token'),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () async {
                                  final result = await getIt<SecureStorageService>()
                                      .deleteToken();
                                  result.fold(
                                    (failure) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      SnackBar(content: Text(failure.message)),
                                    ),
                                    (_) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content: Text('Token deleted successfully'),
                                      ),
                                    ),
                                  );
                                  setState(() {});
                                },
                                child: const Text('Delete Token'),
                              ),
                            ],
                          ),
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
