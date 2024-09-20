import 'package:flutter/material.dart';
import 'package:rangyatra/screens/splash_screen.dart';
import 'package:rangyatra/theme/theme_data.dart';

void main() {
  runApp(const ColorQuestApp());
}

class ColorQuestApp extends StatelessWidget {
  const ColorQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Quest',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode:
          ThemeMode.system,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
