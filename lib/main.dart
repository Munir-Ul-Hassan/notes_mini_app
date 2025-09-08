import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'features/notes/view/notes_page.dart';
import 'features/notes/viewmodel/notes_viewmodel.dart';
import 'features/settings/viewmodel/theme_viewmodel.dart';
import 'features/posts/viewmodel/posts_viewmodel.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotesViewModel()),
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
        ChangeNotifierProvider(create: (_) => PostsViewModel()),
      ],
      child: Consumer<ThemeViewModel>(
        builder: (context, themeVM, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Notes Mini-App',
          theme: AppTheme.lightTheme(themeVM.seedColor),
          darkTheme: AppTheme.darkTheme(themeVM.seedColor),
          themeMode: themeVM.themeMode,
          home: const MainAppScaffold(), // <--- Use the new scaffold
        ),
      ),
    );
  }
}
