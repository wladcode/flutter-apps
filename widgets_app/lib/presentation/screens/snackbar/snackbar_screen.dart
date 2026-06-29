import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Aqui mensaje snackbar'),
      persist: false,
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbar Screen')),
      body: const _SnackbarView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: Text('Show snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
        //backgroundColor: Colors.purple,
      ),
    );
  }
}

class _SnackbarView extends StatelessWidget {
  const _SnackbarView();

   void showCustomDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Estas seguro?'),
        content: Text('Esta accion no se puede deshacer'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
          FilledButton(onPressed: () => Navigator.pop(context), child: Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () {
              showAboutDialog(
                context: context,
                children: [Text('Version 1.0.0'), Text('Copyright 2026')],
              );
            },
            child: const Text('Licencias activas'),
          ),
          FilledButton.tonal(
            onPressed: () => showCustomDialog(context),
            child: const Text('Mostra dialog'),
          ),
        ],
      ),
    );
  }
}
