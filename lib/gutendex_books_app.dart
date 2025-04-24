import 'features/home/home_feature.dart';
import 'package:flutter/material.dart';
import 'core/core.dart';

class GutendexBooksApp extends StatelessWidget {
  const GutendexBooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gutendex Books',
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomScrollBehavior(),
      home: const HomeScreen(),
    );
  }
}
