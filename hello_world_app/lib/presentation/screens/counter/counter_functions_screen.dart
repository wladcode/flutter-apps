import 'package:flutter/material.dart';
import 'package:hello_world_app/config/theme/app_theme.dart';
import 'package:hello_world_app/presentation/widgets/_components/buttons/custom_button.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        leading: IconButton(
          tooltip: 'Reset',
          icon: Icon(
            Icons.refresh_rounded,
            color: counter == 0 ? Colors.white38 : Colors.white,
          ),
          onPressed: counter == 0
              ? null
              : () => setState(() => counter = 0),
        ),
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
          CustomButton(
            heroTag: 'increment',
            activeColor: const Color(0xFF2E7D32),
            icon: Icons.add_rounded,
            onPressed: () => setState(() => counter++),
          ),
          const SizedBox(height: 12),
          CustomButton(
            heroTag: 'decrement',
            activeColor: const Color(0xFFC62828),
            icon: Icons.remove_rounded,
            onPressed: counter == 0
                ? null
                : () => setState(() => counter--),
          ),
        ],
      ),
    );
  }
}
