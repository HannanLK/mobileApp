import 'package:flutter/material.dart';
import '../../widgets/bottomnav.dart';
import '../cart/cart.dart';
import '../product_details/product_detail1.dart';
import '../profile/profile.dart';
import '../store/store.dart';
import '../wishlist/wishlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentBannerIndex = 0;
  int _selectedIndex = 0;

  final List<String> banners = [
    'assets/images/banners/banner0.png',
    'assets/images/banners/banner1.png',
    'assets/images/banners/banner2.png',
  ];

  final List<IconData> categories = [
    Icons.watch,
    Icons.change_history_rounded,
    Icons.card_giftcard_rounded,
    Icons.pages_rounded,
    Icons.sports_basketball,
    Icons.percent,
    Icons.computer_rounded,
    Icons.bookmark,
    Icons.boy,
    Icons.local_florist,
  ];

  final List<String> categoryNames = [
    'Watch', 'Limited', 'Gifts', 'Clothes', 'Sports Wear', 'Special Offer', 'Electronics', 'Blogs', 'Mens', 'Womens'
  ];

  final List<Map<String, dynamic>> newArrivals = [
    {
      'image': 'assets/images/products/newArrivals/new1.jpg',
      'name': 'Open Jacket',
      'price': '\$150',
    },
    {
      'image': 'assets/images/products/newArrivals/new2.jpg',
      'name': 'Long Sleeve Shirt',
      'price': '\$120',
    },
    {
      'image': 'assets/images/products/newArrivals/new3.jpg',
      'name': 'Beach Wear',
      'price': '\$130',
    },
    {
      'image': 'assets/images/products/newArrivals/new4.jpg',
      'name': 'Skirt',
      'price': '\$140',
    },
    {
      'image': 'assets/images/products/newArrivals/new5.jpg',
      'name': 'Long Dress',
      'price': '\$160',
    },
  ];

  final List<Map<String, dynamic>> featuredProducts = [
    {
      'image': 'assets/images/products/featured/acc1.jpg',
      'name': 'Leather Belts',
      'price': '\$100',
    },
    {
      'image': 'assets/images/products/featured/acc2.jpg',
      'name': 'Tops',
      'price': '\$110',
    },
    {
      'image': 'assets/images/products/featured/acc3.jpg',
      'name': 'Yardley Perfumes',
      'price': '\$120',
    },
    {
      'image': 'assets/images/products/featured/acc4.jpg',
      'name': 'Long Sleeve Shirt',
      'price': '\$150',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StorePage()));
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
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        color: isDarkTheme ? Colors.black : Colors.white, // Set the background color
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(isDarkTheme),
              _buildPopularCategories(isDarkTheme),
              _buildBodySection(isDarkTheme),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  // Custom App Bar with interactive search field and Cart Button
  Widget _buildAppBar(bool isDarkTheme) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          color: Colors.blue, // Keep the app bar blue
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good day for shopping,',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: isDarkTheme ? Colors.white : Colors.black, // Greeting text changes based on theme
                ),
              ),
              Text(
                'Taimoor Sikander',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: isDarkTheme ? Colors.white : Colors.black, // Name text changes based on theme
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: isDarkTheme ? Colors.black : Colors.white, // Search box changes to black in dark mode
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search in Store',
                      hintStyle: TextStyle(color: isDarkTheme ? Colors.white70 : Colors.grey),
                      icon: Icon(Icons.search, color: isDarkTheme ? Colors.white : Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: isDarkTheme ? Colors.white : Colors.black), // Cart icon color
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
            },
          ),
        ),
      ],
    );
  }

  // Scrollable popular categories section
  Widget _buildPopularCategories(bool isDarkTheme) {
    return Container(
      color: Colors.blue,  // Keep this blue
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Popular Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkTheme ? Colors.white : Colors.black, // Change text color based on theme
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: isDarkTheme ? Colors.grey[850] : Colors.white, // Category icon background
                        radius: 30,
                        child: Icon(categories[index], color: isDarkTheme ? Colors.white : Colors.black, size: 30),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        categoryNames[index],
                        style: TextStyle(fontSize: 12, color: isDarkTheme ? Colors.white : Colors.black), // Text color
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Body section with banners and products
  Widget _buildBodySection(bool isDarkTheme) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkTheme ? Colors.black : Colors.white, // Background color
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBannerSection(),
            const SizedBox(height: 16),
            _buildProgressBar(),
            const SizedBox(height: 16),
            _buildNewArrivals(isDarkTheme),
            const SizedBox(height: 16),
            _buildFeaturedProducts(isDarkTheme),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerSection() {
    return SizedBox(
      height: 160,
      child: PageView.builder(
        itemCount: banners.length,
        onPageChanged: (index) {
          setState(() {
            _currentBannerIndex = index;
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
    );
  }

  Widget _buildProgressBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(banners.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentBannerIndex == index ? Colors.blue : Colors.grey,
          ),
        );
      }),
    );
  }

  Widget _buildNewArrivals(bool isDarkTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('NEW ARRIVALS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: newArrivals.length,
            itemBuilder: (context, index) {
              return _buildProductCard(newArrivals[index], isDarkTheme);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedProducts(bool isDarkTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('FEATURED PRODUCTS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featuredProducts.length,
            itemBuilder: (context, index) {
              return _buildProductCard(featuredProducts[index], isDarkTheme);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product, bool isDarkTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetail1()));
        },
        child: SizedBox(
          width: 165,
          child: Card(
            color: isDarkTheme ? Colors.grey[850] : Colors.white, // Card color changes based on theme
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    child: Image.asset(
                      product['image'],
                      width: double.infinity,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product['name'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product['price'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: Icon(Icons.shopping_cart_outlined, color: isDarkTheme ? Colors.white : Colors.black),
                            onPressed: () {
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
        ),
      ),
    );
  }
}
