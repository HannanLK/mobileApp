import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blueAccent, // Dark blue for light mode
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: const AppBarTheme(
      color: Colors.blueAccent, // Dark blue AppBar
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.blueAccent), // Dark blue toggle button thumb
      trackColor: MaterialStateProperty.all(Colors.blue[200]), // Light blue track
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black54),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[900], // Dark grey for dark mode
    scaffoldBackgroundColor: Colors.black,
    cardColor: Colors.grey[850],
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
      color: Colors.grey[900], // Dark grey AppBar
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.grey[700]), // Dark grey toggle button thumb
      trackColor: MaterialStateProperty.all(Colors.grey[600]), // Dark grey track
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );
}
