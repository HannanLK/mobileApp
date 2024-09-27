import 'package:flutter/material.dart';
import '../../widgets/bottomnav.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  int _selectedIndex = 1; // Default to StorePage as selected

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home'); // Navigate to HomePage
        break;
      case 1:
      // Already on StorePage, no action required
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/wishlist'); // Navigate to WishlistPage
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile'); // Navigate to ProfilePage
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Center(
        child: Text('Welcome to the Store Page!'),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
