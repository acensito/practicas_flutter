import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const routeName = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicators')),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text('Progress Indicator'),
          CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 30),
          const Text('Circular progress controlated'),

      ]),
    );
  }
}
