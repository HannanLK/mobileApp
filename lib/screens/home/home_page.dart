import 'package:flutter/material.dart';
import '../product_details/product_detail1.dart';
import '../product_details/product_detail2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentBannerIndex = 0;

  final List<String> banners = [
    'assets/images/banners/banner1.png',
    'assets/images/banners/banner2.png',
    'assets/images/banners/banner3.png',
  ];

  final List<String> categories = [
    'assets/icons/icon1.png',
    'assets/icons/icon2.png',
    'assets/icons/icon3.png',
    'assets/icons/icon4.png',
    'assets/icons/icon5.png',
    'assets/icons/icon6.png',
    'assets/icons/icon7.png',
    'assets/icons/icon8.png',
    'assets/icons/icon9.png',
    'assets/icons/icon10.png',
    'assets/icons/icon11.png',
    'assets/icons/icon12.png',
  ];

  final List<Map<String, dynamic>> newArrivals = [
    {
      'image': 'assets/images/products/newArrivals/newar1.jpg',
      'name': 'Nike Sneakers',
      'price': '\$150',
    },
    {
      'image': 'assets/images/products/newArrivals/newar2.jpg',
      'name': 'Adidas Sports Shoe',
      'price': '\$120',
    },
  ];

  final List<Map<String, dynamic>> featuredProducts = [
    {
      'image': 'assets/images/products/featured/feat1.jpg',
      'name': 'Puma Running Shoe',
      'price': '\$100',
    },
    {
      'image': 'assets/images/products/featured/feat2.jpg',
      'name': 'Reebok Classic',
      'price': '\$110',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderSection(),
              const SizedBox(height: 16),
              _buildBannerSection(),
              const SizedBox(height: 16),
              _buildProgressBar(),
              const SizedBox(height: 16),
              _buildPopularCategories(),
              const SizedBox(height: 16),
              _buildNewArrivals(),
              const SizedBox(height: 16),
              _buildFeaturedProducts(),
            ],
          ),
        ),
      ),
    );
  }

  // Header with greeting and search bar
  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Good day for shopping, Hannan Munas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 10),
                Text('Search in Store', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Banner section with progress bar
  Widget _buildBannerSection() {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemCount: banners.length,
        onPageChanged: (index) {
          setState(() {
            _currentBannerIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Image.asset(banners[index], fit: BoxFit.cover);
        },
      ),
    );
  }

  // Progress bar for the banner
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

  // Scrollable popular categories section
  Widget _buildPopularCategories() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(categories[index]),
                  radius: 30,
                ),
                const SizedBox(height: 5),
                Text('Category ${index + 1}', style: TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }

  // New Arrivals section
  Widget _buildNewArrivals() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('New Arrivals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildProductCards('newArrivals'),
        ],
      ),
    );
  }

  // Featured Products section
  Widget _buildFeaturedProducts() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Featured Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildProductCards('featured'),
        ],
      ),
    );
  }

  // Product card builder for both New Arrivals and Featured Products
  Widget _buildProductCards(String type) {
    final List<Map<String, dynamic>> products = type == 'newArrivals'
        ? newArrivals
        : featuredProducts;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            if (type == 'newArrivals' && index == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail1()));
            } else if (type == 'newArrivals' && index == 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail2()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product Details for ${product['name']}')));
            }
          },
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(product['image'], height: 100, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product['name'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      Text(product['price'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {
                          setState(() {
                            // Toggle favorite color on press
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
