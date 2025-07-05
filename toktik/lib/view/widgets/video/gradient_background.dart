import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;

  const GradientBackground({
    super.key,
    this.colors = const [Colors.black87, Colors.transparent],
    this.stops = const [0.1, 0.5],
  }) : assert(
         colors.length == stops.length,
         'Stops and Colors must be same length',
       );

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
