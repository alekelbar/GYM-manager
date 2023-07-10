import 'package:flutter/material.dart';

class ThemeConfig {
  final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
    useMaterial3: true,
  );

  ThemeData getTheme() => theme;
}
