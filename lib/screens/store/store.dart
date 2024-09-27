import 'package:flutter/material.dart';
import '../cart/cart.dart'; // Import your cart page
import '../product_details/product_detail1.dart'; // Import your product detail page
import '../profile/profile.dart';
import '../wishlist/wishlist.dart';
import '../home/home_page.dart'; // For navigation to HomePage
import '../../widgets/bottomnav.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isDarkTheme = false;
  int _selectedIndex = 1; // Set default index to 'Store'
  int _currentBannerIndex = 0; // Track the current banner index

  final List<String> banners = [
    'assets/images/banners/banner1.png',
    'assets/images/banners/banner0.png',
    'assets/images/banners/banner2.png',
  ];

  final List<Map<String, dynamic>> mensProducts = [
    {'image': 'assets/images/products/mens/men1.jpg', 'name': 'Black Kit', 'price': 100.0},
    {'image': 'assets/images/products/mens/men2.jpg', 'name': 'Party Shirt', 'price': 150.0},
    {'image': 'assets/images/products/mens/men3.jpg', 'name': 'Long Sleeve Shirt', 'price': 170.0},
    {'image': 'assets/images/products/mens/men4.jpg', 'name': 'Formal', 'price': 180.0},
    {'image': 'assets/images/products/mens/men5.jpg', 'name': 'Casual', 'price': 190.0},
    {'image': 'assets/images/products/mens/men6.jpg', 'name': 'Beach', 'price': 120.0},
    {'image': 'assets/images/products/mens/men7.jpg', 'name': 'JVP', 'price': 250.0},
    {'image': 'assets/images/products/mens/men8.jpg', 'name': 'Wedding', 'price': 350.0},
  ];

  final List<Map<String, dynamic>> womensProducts = [
    {'image': 'assets/images/products/womens/wom1.jpg', 'name': 'Womens Top', 'price': 120.0},
    {'image': 'assets/images/products/womens/wom2.jpg', 'name': 'Womens Skirt', 'price': 80.0},
    {'image': 'assets/images/products/womens/wom3.jpg', 'name': 'Womens Jacket', 'price': 120.0},
    {'image': 'assets/images/products/womens/wom4.jpg', 'name': 'Womens Dress', 'price': 80.0},
    {'image': 'assets/images/products/womens/wom5.jpg', 'name': 'Womens Maxi', 'price': 120.0},
    {'image': 'assets/images/products/womens/wom6.jpg', 'name': 'Womens Skirt', 'price': 80.0},
    {'image': 'assets/images/products/womens/wom7.jpg', 'name': 'Womens Pants', 'price': 120.0},
    {'image': 'assets/images/products/womens/wom8.jpg', 'name': 'Womens Skirts', 'price': 80.0},
    {'image': 'assets/images/products/womens/wom9.jpg', 'name': 'Womens Dress', 'price': 120.0},
    {'image': 'assets/images/products/womens/wom10.jpg', 'name': 'Womens Handbag', 'price': 80.0},
  ];

  final List<Map<String, dynamic>> accessoriesProducts = [
    {'image': 'assets/images/products/accessories/acc1.jpg', 'name': 'Black Belt', 'price': 50.0},
    {'image': 'assets/images/products/accessories/acc2.jpg', 'name': 'Brown Belt', 'price': 200.0},
    {'image': 'assets/images/products/accessories/acc3.jpg', 'name': 'Perfume', 'price': 50.0},
    {'image': 'assets/images/products/accessories/acc4.jpg', 'name': 'Cufflink', 'price': 200.0},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index for BottomNav
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 1:
      // Stay on the Store Page
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WishlistPage()));
        break;
      case 3:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkTheme ? Colors.black : Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Store', style: TextStyle(color: isDarkTheme ? Colors.white : Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: isDarkTheme ? Colors.white : Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blueAccent,
          labelColor: isDarkTheme ? Colors.white : Colors.black,
          unselectedLabelColor: isDarkTheme ? Colors.white70 : Colors.black54,
          tabs: const [
            Tab(text: 'Mens'),
            Tab(text: 'Womens'),
            Tab(text: 'Accessories'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildProductGrid(mensProducts),
          _buildProductGrid(womensProducts),
          _buildProductGrid(accessoriesProducts),
        ],
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  // Widget for the scrollable banner section with progress dots
  Widget _buildBannerSection() {
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: PageView.builder(
            itemCount: banners.length,
            onPageChanged: (index) {
              setState(() {
                _currentBannerIndex = index; // Update banner index when changed
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(banners[index], fit: BoxFit.cover),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8), // Add space between banner and dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(banners.length, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentBannerIndex == index ? 10 : 8,
              height: _currentBannerIndex == index ? 10 : 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentBannerIndex == index ? Colors.blueAccent : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }

  // Widget to display products in a grid
  Widget _buildProductGrid(List<Map<String, dynamic>> products) {
    return Column(
      children: [
        const SizedBox(height: 16),
        _buildBannerSection(), // Insert scrollable banner section with dots
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.6,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _buildProductCard(products[index]);
              },
            ),
          ),
        ),
      ],
    );
  }

  // Widget to display individual product card
  Widget _buildProductCard(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetail1()));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: isDarkTheme ? Colors.grey[850] : Colors.white,
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
                          child: Icon(Icons.shopping_cart_outlined, color: isDarkTheme ? Colors.black : Colors.white),
                        ),
                        onPressed: () {
                          // Add to cart logic or navigate to cart
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
      ),
    );
  }
}
