import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbar Screen')),
      body: const _SnackbarView(),
    );
  }
}

class _SnackbarView extends StatelessWidget {
  const _SnackbarView();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
} 