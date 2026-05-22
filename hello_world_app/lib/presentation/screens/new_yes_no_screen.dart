import 'package:flutter/material.dart';
import 'package:hello_world_app/config/theme/app_theme.dart';

class NewYesNoScreen extends StatefulWidget {
  const NewYesNoScreen({super.key});

  @override
  State<NewYesNoScreen> createState() => _NewYesNoScreenState();
}

class _NewYesNoScreenState extends State<NewYesNoScreen> {
  bool _isLightOn = false;

  void _toggleLight(bool isOn) {
    setState(() {
      _isLightOn = isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Light Control Screen'),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Bulb display
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isLightOn ? Colors.yellow : Colors.grey[300],
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.brightness_5,
                  size: 100,
                  color: _isLightOn ? Colors.orange : Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _toggleLight(true),
                  child: const Text('Turn On'),
                ),
                ElevatedButton(
                  onPressed: () => _toggleLight(false),
                  child: const Text('Turn Off'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}