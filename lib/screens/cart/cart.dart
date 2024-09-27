import 'package:flutter/material.dart';
import '../store/store.dart'; // Import your store page

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isDarkTheme = false; // This should be based on your global theme setting

  // List of products in the cart
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Womens Top',
      'price': 134.0,
      'quantity': 1,
      'image': 'assets/images/products/womens/wom1.jpg',
      'color': 'Pink',
      'size': 'EU 34',
    },
    {
      'name': 'Envoy Leather Belt',
      'price': 35.0,
      'quantity': 1,
      'image': 'assets/images/products/accessories/acc2.jpg',
      'color': 'Brown',
      'size': 'M',
    },
    {
      'name': 'Beach Wear',
      'price': 800.0,
      'quantity': 2,
      'image': 'assets/images/products/mens/men6.jpg',
      'color': 'Orange',
      'size': 'EU 42',
    },
    {
      'name': 'Jacket',
      'price': 500.0,
      'quantity': 1,
      'image': 'assets/images/products/womens/wom2.jpg',
      'color': 'Blue',
      'size': 'L',
    },
  ];

  double get totalAmount {
    return cartItems.fold(0.0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkTheme ? Colors.black : Colors.white, // Change background color based on theme
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkTheme ? Colors.white : Colors.black), // Change icon color based on theme
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StorePage()));
          },
        ),
        title: Text(
          'Cart',
          style: TextStyle(color: isDarkTheme ? Colors.white : Colors.black), // Change title color based on theme
        ),
        elevation: 0, // Remove the shadow from the app bar
      ),
      body: Container(
        color: isDarkTheme ? Colors.black : Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return _buildCartItem(cartItems[index]);
                },
              ),
            ),
            _buildCheckoutSection(),
          ],
        ),
      ),
    );
  }

  // Widget for each cart item
  Widget _buildCartItem(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        color: isDarkTheme ? Colors.grey[800] : Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            // Image section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                item['image'],
                width: 80,
                height: 80,
                fit: BoxFit.cover, // Adjust image fit to fill the height of the card
              ),
            ),
            // Product details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDarkTheme ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Color: ${item['color']}  Size: ${item['size']}',
                    style: TextStyle(color: isDarkTheme ? Colors.white70 : Colors.black54),
                  ),
                ],
              ),
            ),
            // Quantity and price section
            Column(
              children: [
                Text(
                  '\$${item['price'] * item['quantity']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
                Row(
                  children: [
                    // Minus button with ash background
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.grey), // Ash color
                      onPressed: () {
                        setState(() {
                          if (item['quantity'] > 1) {
                            item['quantity']--;
                          }
                        });
                      },
                    ),
                    Text(
                      '${item['quantity']}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDarkTheme ? Colors.white : Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: CircleAvatar(
                        backgroundColor: isDarkTheme ? Colors.white : Colors.black,
                        radius: 14, // Smaller size for the circle button
                        child: Icon(Icons.add, color: isDarkTheme ? Colors.black : Colors.white, size: 16),
                      ), // Circle background and icon color changes based on the theme
                      onPressed: () {
                        setState(() {
                          item['quantity']++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget for the checkout section
  Widget _buildCheckoutSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: isDarkTheme ? Colors.black : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Checkout \$${totalAmount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle checkout logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isDarkTheme ? Colors.white : Colors.black, // Button background changes with theme
              foregroundColor: isDarkTheme ? Colors.black : Colors.white, // Text and icon color
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
