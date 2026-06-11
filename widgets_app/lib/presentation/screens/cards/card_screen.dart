import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  static const name = 'cards_screen';
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Card Screen')),
      body: Placeholder(),
    );
  }
}