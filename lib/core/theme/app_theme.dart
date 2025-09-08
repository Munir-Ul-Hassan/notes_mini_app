import 'package:flutter/material.dart';

class AppTheme {
  static const seedColor = Colors.indigo;

  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.light),
    useMaterial3: true,
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.dark),
    useMaterial3: true,
    brightness: Brightness.dark,
  );
}