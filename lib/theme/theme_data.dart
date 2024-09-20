import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.redAccent,
    colorScheme: const ColorScheme.light(
      secondary: Colors.purple,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.blueAccent,
    ),
    textTheme: TextTheme(
      headlineMedium: const TextStyle(color: Colors.black), 
      bodyMedium: TextStyle(color: Colors.grey[800]),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.dark(
      secondary: Colors.amber,
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      headlineMedium: const TextStyle(color: Colors.white70), 
      bodyMedium: TextStyle(color: Colors.grey[300]),
    ),
  );
}
