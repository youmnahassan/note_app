import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/note_provider.dart';
import 'screens/home_layout.dart';
import 'core/theme.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteProvider()..fetchNotes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Note App',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode:
            ThemeMode.system, // ممكن تخليها ThemeMode.light أو dark حسب رغبتك
        home: const HomeLayout(),
      ),
    );
  }
}
