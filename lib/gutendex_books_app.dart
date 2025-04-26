import 'package:flutter/material.dart';
import 'core/core.dart';

class GutendexBooksApp extends StatelessWidget {
  final AppRouter appRouter;
  const GutendexBooksApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gutendex Books',
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomScrollBehavior(),
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
