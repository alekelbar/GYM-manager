import 'package:flutter/material.dart';

class ThemeConfig {
  final ThemeData theme = ThemeData(
    colorSchemeSeed: Colors.white70,
    useMaterial3: true,
    brightness: Brightness.light,
  );

  ThemeData getTheme() => theme;
}
