import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedScreen extends StatefulWidget {

  static const routeName = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double _width = 50;
  double _height = 50;
  Color _color = Colors.indigo;
  double _borderRadius = 10.0;

  void changeShape() {
    final random = Random();

    setState(() {
      _width = random.nextInt(300)+50;
      _height = random.nextInt(300)+50;
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      _borderRadius = random.nextInt(100)*20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Screen'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.elasticOut,
          width: _width <= 0 ? 0 : _width,
          height: _height <= 0 ? 0 : _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius < 0
                ? BorderRadius.circular(0)
                : BorderRadius.circular(_borderRadius),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeShape();
        },
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}