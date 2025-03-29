import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF6200EE);

const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.pink,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.teal,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorTheme.length - 1,
            'Color must be  between 0 and ${_colorTheme.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorTheme[selectedColor]);
  }
}
