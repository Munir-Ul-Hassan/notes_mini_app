import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeViewModel extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Color _seedColor = Colors.indigo;
  static const _themeKey = 'theme_mode';
  static const _seedKey = 'seed_color';

  ThemeMode get themeMode => _themeMode;
  Color get seedColor => _seedColor;

  ThemeViewModel() {
    _loadPrefs();
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _savePrefs();
    notifyListeners();
  }

  void setSeedColor(Color color) {
    _seedColor = color;
    _savePrefs();
    notifyListeners();
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(_themeKey);
    if (themeString != null) {
      _themeMode = ThemeMode.values.firstWhere((e) => e.toString() == themeString, orElse: () => ThemeMode.system);
    }
    final seedInt = prefs.getInt(_seedKey);
    if (seedInt != null) {
      _seedColor = Color(seedInt);
    }
    notifyListeners();
  }

  Future<void> _savePrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, _themeMode.toString());
    await prefs.setInt(_seedKey, _seedColor.value);
  }
}