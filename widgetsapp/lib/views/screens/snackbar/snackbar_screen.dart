import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const routeName = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).clearSnackBars(); // Elimina cualquier Snackbar previo

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hola desde un Snackbar personalizado'),
        action: SnackBarAction(label: 'Aceptar', onPressed: () {}),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars y Dialogos')),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
