import 'package:flutter/material.dart';
import '../cart/cart.dart'; // Import your cart page
import '../store/store.dart'; // Import your store page
import '../profile/profile.dart';
import '../home/home_page.dart'; // Import your home page
import '../../widgets/bottomnav.dart'; // Import your bottom navigation

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  bool isDarkTheme = false;
  int _selectedIndex = 2; // Set default index to 'Wishlist'

  // Wishlist products
  final List<Map<String, dynamic>> wishlistItems = [
    {
      'image': 'assets/images/products/womens/wom1.jpg',
      'name': 'Womens Clothing',
      'price': 334.0,
    },
    {
      'image': 'assets/images/products/mens/men1.jpg',
      'name': 'Mens Wear',
      'price': 135.0,
    },
    {
      'image': 'assets/images/products/accessories/acc2.jpg',
      'name': 'Accessories',
      'price': 50.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkTheme ? Colors.black : Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkTheme ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StorePage()));
          },
        ),
        title: Text('Wishlist', style: TextStyle(color: isDarkTheme ? Colors.white : Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: isDarkTheme ? Colors.white : Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
            },
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        color: isDarkTheme ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 items per row
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.6, // Adjust the ratio for better alignment
            ),
            itemCount: wishlistItems.length,
            itemBuilder: (context, index) {
              return _buildWishlistCard(wishlistItems[index]);
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  // Wishlist product card
  Widget _buildWishlistCard(Map<String, dynamic> product) {
    return Card(
      color: isDarkTheme ? Colors.grey[800] : Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                product['image'],
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product['price'].toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isDarkTheme ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    IconButton(
                      icon: CircleAvatar(
                        backgroundColor: isDarkTheme ? Colors.white : Colors.black,
                        radius: 16, // Adjust size for circle icon
                        child: Icon(Icons.add_shopping_cart, color: isDarkTheme ? Colors.black : Colors.white),
                      ),
                      onPressed: () {
                        // Add to cart logic
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Bottom navigation handler
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index for BottomNav
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StorePage()));
        break;
      case 2:
      // Stay on Wishlist Page
        break;
      case 3:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
        break;
    }
  }
}
