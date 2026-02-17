import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart' hide State;
import '../../domain/usecases/get_user.dart';
import '../../domain/entities/user.dart';
import '../../../../core/error/failures.dart';

/// User page that receives dependencies through constructor
class UserPage extends StatefulWidget {
  final GetUser getUserUseCase;

  const UserPage({
    super.key,
    required this.getUserUseCase,
  });

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  User? _user;
  String? _error;
  bool _isLoading = false;

  Future<void> _loadUser() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    final result = await widget.getUserUseCase(1);

    setState(() {
      _isLoading = false;
      result.fold(
        (failure) => _error = failure.message,
        (user) => _user = user,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : _error != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error: $_error',
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadUser,
                        child: const Text('Retry'),
                      ),
                    ],
                  )
                : _user != null
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ID: ${_user!.id}',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Name: ${_user!.name}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Username: ${_user!.username}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Email: ${_user!.email}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: _loadUser,
                              child: const Text('Refresh'),
                            ),
                          ],
                        ),
                      )
                    : const Text('No data'),
      ),
    );
  }
}
