import 'package:flutter/material.dart';
import 'package:hw_36/presentation/pages/posts_page.dart';

class Hw36App extends StatelessWidget {
  const Hw36App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HW36 — Clean Architecture',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const PostsPage(),
    );
  }
}
