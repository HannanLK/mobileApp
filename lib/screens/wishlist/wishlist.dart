import 'package:flutter/material.dart';
import '../../widgets/bottomnav.dart'; // Import the BottomNav widget

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  int _selectedIndex = 2; // Default to WishlistPage as selected

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
        Navigator.pushReplacementNamed(context, '/store'); // Navigate to StorePage
        break;
      case 2:
      // Already on WishlistPage, no action required
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
        title: const Text('Wishlist'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Center(
        child: Text('Your Wishlist is Empty!'),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
