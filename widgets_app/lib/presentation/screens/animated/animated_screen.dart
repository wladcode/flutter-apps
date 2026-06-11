import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Screen')),
      body: const _AnimatedView(),
    );
  }
}

class _AnimatedView extends StatelessWidget {
  const _AnimatedView();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
