import 'package:flutter/material.dart';
import 'package:hello_world_app/config/theme/app_theme.dart';
import 'package:hello_world_app/presentation/screens/counter/counter_functions_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const CounterFunctionsScreen(),
    );
  }
}
