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

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible:
          false, // Evita que se cierre al tocar fuera del dialogo
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Dialogo de ejemplo'),
          content: const Text(
            'lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars y Dialogos')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'Widgets App',
                  applicationVersion: '1.0.0',
                  applicationIcon: const Icon(Icons.widgets_outlined, size: 50),
                  children: [
                    const Text(
                      'Esta es una aplicacion de ejemplo para mostrar widgets de Flutter.',
                    ),
                    const SizedBox(height: 10),
                    const Text('Desarrollado por Felipon2T'),
                  ],
                );
              },
              child: Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: Text('Mostrar dialogo'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
