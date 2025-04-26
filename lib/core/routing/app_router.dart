import 'package:nagwa_task/features/home/home_feature.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagwa_task/core/core.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Home Feature
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider(
              create: (context) => getIt<HomeCubit>()..getBooksList(),
              child: const HomeScreen(),
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(body: Center(child: Text("No route define for ${settings.name}")));
          },
        );
    }
  }
}
