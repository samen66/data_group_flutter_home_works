import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class CounterModel {
  static const String _counterKey = 'counter';
  int counter = 0;

  Future<int> loadCounter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    counter = prefs.getInt(_counterKey) ?? 0;
    return counter;
  }

  Future<void> saveCounter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_counterKey, counter);
  }

  Future<void> increment() async {
    counter += 1;
    await saveCounter();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterModel counterModel = CounterModel();

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    await counterModel.loadCounter();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  Future<void> _incrementCounter() async {
    await counterModel.increment();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: ${counterModel.counter}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
