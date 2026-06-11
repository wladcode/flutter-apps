import 'package:flutter/material.dart';

class TutorialScreen extends StatelessWidget {
  static const name = 'tutorial_screen';
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tutorial Screen')),
      body: const _TutorialView(),
    );
  }
}

class _TutorialView extends StatelessWidget {
  const _TutorialView();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}