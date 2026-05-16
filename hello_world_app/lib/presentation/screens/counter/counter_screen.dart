import 'package:flutter/material.dart';
import 'package:hello_world_app/config/theme/app_theme.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    counter.toString(),
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w200,
                      color: AppTheme.primary,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    counter == 1 ? 'Click' : 'Clicks',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textSecondary,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            backgroundColor: const Color(0xFF2E7D32),
            onPressed: () => setState(() => counter++),
            child: const Icon(Icons.add_rounded, color: Colors.white),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'decrement',
            backgroundColor:
                counter == 0 ? Colors.grey.shade400 : const Color(0xFFC62828),
            onPressed:
                counter == 0 ? null : () => setState(() => counter--),
            child: const Icon(Icons.remove_rounded, color: Colors.white),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'reset',
            backgroundColor:
                counter == 0 ? Colors.grey.shade400 : const Color(0xFFE65100),
            onPressed:
                counter == 0 ? null : () => setState(() => counter = 0),
            child: const Icon(Icons.refresh_rounded, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
