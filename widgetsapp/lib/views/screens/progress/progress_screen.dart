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
          const Text('Circular y linear controlated'),
          const _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value*2) / 100; // Simulate a progress value from 0.0 to 1.0
      }).takeWhile((value) => value <= 1.0),
      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0.0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value: progressValue, strokeWidth: 2),
              const SizedBox(width: 20),
              Expanded(
                child: LinearProgressIndicator(value: progressValue),
              ),
            ],
          ),
        );
      }
    );
  }
}
