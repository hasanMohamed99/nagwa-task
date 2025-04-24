import 'package:nagwa_task/core/core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(body: Center(child: Text('Home Screen', style: AppTextStyles.font24SemiBold))),
    );
  }
}
