import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme(Color seedColor) => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.light),
    useMaterial3: true,
    brightness: Brightness.light,
  );

  static ThemeData darkTheme(Color seedColor) => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.dark),
    useMaterial3: true,
    brightness: Brightness.dark,
  );
}