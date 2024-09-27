import 'package:flutter/material.dart';

import '../cart/cart.dart';

class ProductDetail1 extends StatefulWidget {
  const ProductDetail1({super.key});

  @override
  _ProductDetail1State createState() => _ProductDetail1State();
}

class _ProductDetail1State extends State<ProductDetail1> {
  bool isFavorite = false;
  int productQuantity = 1;

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDarkTheme ? Colors.grey[900] : Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkTheme ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context); // Return to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : (isDarkTheme ? Colors.white : Colors.black),
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite; // Toggle favorite status
              });
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main Image and Thumbnails
          _buildImageSection(isDarkTheme),

          // Product Information
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Pencil Skirt',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '\$400.00',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '33% Off',
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'In Stock',
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'GFlock',
                    style: TextStyle(color: isDarkTheme ? Colors.blueAccent : Colors.blue),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Explore our elegant evening wear collection, featuring chic designs and luxurious fabrics for every special occasion. Shine effortlessly at your next event.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.justify, // Justify the description text
                  ),
                ],
              ),
            ),
          ),

          // Quantity Selector and Add to Cart Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Quantity Selector
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (productQuantity > 1) {
                            productQuantity--;
                          }
                        });
                      },
                    ),
                    Text(
                      productQuantity.toString(),
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          productQuantity++;
                        });
                      },
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to the Cart Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartPage()),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('Add to Bag'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkTheme ? Colors.white : Colors.black, // Black in light mode, white in dark mode
                    foregroundColor: isDarkTheme ? Colors.black : Colors.white, // Text and icon color change accordingly
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Main Image and Thumbnails
  Widget _buildImageSection(bool isDarkTheme) {
    return Column(
      children: [
        // Main Image
        SizedBox(
          height: 350,
          width: double.infinity,
          child: Image.asset(
            'assets/images/products/womens/main_image.jpg',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),

        // Thumbnails
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildThumbnail('assets/images/products/womens/small_image1.jpg'),
            _buildThumbnail('assets/images/products/womens/small_image2.jpg'),
            _buildThumbnail('assets/images/products/womens/small_image3.jpg'),
          ],
        ),
      ],
    );
  }

  // Thumbnail Builder
  Widget _buildThumbnail(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}
