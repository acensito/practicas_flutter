import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF550A9B);
const List<Color> _colorThemes = [
  _customColor,
  Colors.black,
  Colors.redAccent,
  Colors.yellow,
  Colors.lightBlueAccent,
  Colors.teal,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(
        selectedColor >= 0,
        'Colors mus be between 0 and ${_colorThemes.length}',
      );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.light
    );
  }
}
