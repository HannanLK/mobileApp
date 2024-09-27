import 'package:flutter/material.dart';
import 'package:glitzstore/screens/profile/profile.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  // Allows accessing the app's theme globally
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  ThemeData _themeData = ThemeData.light(); // Default theme is light

  // Method to change the theme globally
  void setTheme(ThemeData theme) {
    setState(() {
      _themeData = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Theme Toggle',
      theme: _themeData, // Apply the current theme
      home: const ProfilePage(), // Point to your ProfilePage
    );
  }
}
