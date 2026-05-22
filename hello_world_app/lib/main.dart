import 'package:flutter/material.dart';
import 'package:hello_world_app/config/theme/app_theme.dart';
import 'package:hello_world_app/presentation/screens/chat/chat_screen.dart';
import 'package:hello_world_app/presentation/screens/new_yes_no_screen.dart';
import 'package:hello_world_app/state/inherite/appStateWidget.dart';
import 'package:hello_world_app/state/provider/chat_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: const MyApp(),
    ),
  );
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
        //home: const NewYesNoScreen(),
      ),
    );
    /*return  MaterialApp(
        title: 'Counter App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        darkTheme: AppTheme.darkTheme,
        //home: const CounterFunctionsScreen(),
        //home: const YesNoScreen(),
        home: const ChatScreen(),
        //home: const NewYesNoScreen(),
    );*/
  }
}
