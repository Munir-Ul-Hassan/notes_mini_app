import 'package:flutter/material.dart';
import 'features/notes/view/notes_page.dart';
import 'features/posts/view/posts_page.dart';
import 'features/settings/view/theme_playground_page.dart';

class MainAppScaffold extends StatefulWidget {
  const MainAppScaffold({super.key});

  @override
  State<MainAppScaffold> createState() => _MainAppScaffoldState();
}

class _MainAppScaffoldState extends State<MainAppScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    NotesPage(),
    PostsPage(),
    ThemePlaygroundPage(),
  ];

  final List<String> _titles = const [
    'Notes',
    'Posts',
    'Theme Playground',
  ];

  void _onDrawerTap(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context); // Close drawer
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selectedIndex])),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Notes Mini-App')),
            ListTile(
              leading: const Icon(Icons.note),
              title: const Text('Notes'),
              selected: _selectedIndex == 0,
              onTap: () => _onDrawerTap(0),
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Posts'),
              selected: _selectedIndex == 1,
              onTap: () => _onDrawerTap(1),
            ),
            ListTile(
              leading: const Icon(Icons.palette),
              title: const Text('Theme Playground'),
              selected: _selectedIndex == 2,
              onTap: () => _onDrawerTap(2),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}