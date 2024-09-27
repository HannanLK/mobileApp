import 'package:flutter/material.dart';
import 'package:glitzstore/screens/onboarding/onboarding_screen1.dart';
import 'screens/home/home_page.dart';
import 'screens/store/store.dart';
import 'screens/wishlist/wishlist.dart';
import 'screens/profile/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light; // Default to light theme

  void setTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: _themeMode, // Use themeMode for dynamic switching
      initialRoute: '/onboarding1',
      routes: {
        '/onboarding1': (context) => const OnboardingScreen1(),
        '/home': (context) => const HomePage(),
        '/store': (context) => const StorePage(),
        '/wishlist': (context) => const WishlistPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
