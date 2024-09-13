import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.indigo,
  Colors.pink
];

class AppTheme {
  final int selectedColor;
  final Brightness brightness;

  AppTheme({this.selectedColor = 0, this.brightness = Brightness.light})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'Color index must be between 0 and ${_colorThemes.length - 1}');
  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorThemes[selectedColor],
        brightness: brightness);
  }
}
