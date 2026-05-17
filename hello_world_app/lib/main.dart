import 'package:flutter/material.dart';
import 'package:hello_world_app/config/theme/app_theme.dart';
import 'package:hello_world_app/presentation/screens/chat/chat_screen.dart';
import 'package:hello_world_app/presentation/screens/counter/counter_functions_screen.dart';
import 'package:hello_world_app/presentation/screens/yesno/yesno_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: AppTheme.themeNotifier,
      builder: (context, themeMode, _) => MaterialApp(
        title: 'Counter App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeMode,
        //home: const CounterFunctionsScreen(),
        //home: const YesNoScreen(),
        home: const ChatScreen(),
      ),
    );
  }
}
