import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/home/home_feature.dart';
import 'package:flutter/material.dart';
import 'core/core.dart';

class GutendexBooksApp extends StatelessWidget {
  final AppRouter appRouter;
  const GutendexBooksApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getBooksList(page: 1),
      child: MaterialApp(
        title: 'Gutendex Books',
        debugShowCheckedModeBanner: false,
        scrollBehavior: CustomScrollBehavior(),
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
