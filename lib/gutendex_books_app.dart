import 'package:flutter/material.dart';

class GutendexBooksApp extends StatelessWidget {
  const GutendexBooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Gutendex Books',
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text('Welcome to Gutendex Book App!'))),
    );
  }
}
