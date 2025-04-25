import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagwa_task/core/core.dart';
import 'package:flutter/material.dart';
import 'gutendex_books_app.dart';
import 'generated/assets.dart';

void main() async {
  await dotenv.load(fileName: Assets.envEnv);
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([setupGetIt()]);
  Bloc.observer = MyBlocObserver();
  runApp(GutendexBooksApp(appRouter: AppRouter()));
}
