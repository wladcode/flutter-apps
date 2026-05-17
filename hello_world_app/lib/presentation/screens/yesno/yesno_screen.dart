import 'package:flutter/material.dart';
import 'package:hello_world_app/config/theme/app_theme.dart';

class YesNoScreen extends StatelessWidget {
  const YesNoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yes or No Screen'),
        actions: [
          ValueListenableBuilder<ThemeMode>(
            valueListenable: AppTheme.themeNotifier,
            builder: (context, mode, _) => IconButton(
              icon: Icon(
                mode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
              ),
              tooltip: mode == ThemeMode.dark ? 'Light mode' : 'Dark mode',
              onPressed: AppTheme.toggleTheme,
            ),
          ),
        ],
      ),
      body: Center(
        child: FilledButton(
          onPressed: () {},
          child: Text('Click me'),
          
        ),
      ),
    );
  }
}
