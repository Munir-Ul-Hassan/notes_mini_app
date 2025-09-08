import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/theme_viewmodel.dart';

class ThemePlaygroundPage extends StatelessWidget {
  const ThemePlaygroundPage({super.key});

  static const presetColors = {
    'Indigo': Colors.indigo,
    'Teal': Colors.teal,
    'Deep Orange': Colors.deepOrange,
    'Purple': Colors.purple,
  };

  @override
  Widget build(BuildContext context) {
    final themeVM = Provider.of<ThemeViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Playground')),
      body: Column(
        children: [
          ListTile(
            title: const Text('Theme Mode'),
            trailing: Switch(
              value: themeVM.themeMode == ThemeMode.dark,
              onChanged: (_) => themeVM.toggleTheme(),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 16,
              children: presetColors.entries.map((entry) {
                final name = entry.key;
                final color = entry.value;
                return ChoiceChip(
                  label: Text(name),
                  selected: themeVM.seedColor == color,
                  selectedColor: color,
                  onSelected: (_) => themeVM.setSeedColor(color),
                  labelStyle: TextStyle(
                    color: themeVM.seedColor == color ? Colors.white : Colors.grey,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}