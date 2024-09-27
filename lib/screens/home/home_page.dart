import 'package:flutter/material.dart';
import '../cart/cart.dart';
import '../product_details/product_detail1.dart';
// import '../product_details/product_detail2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentBannerIndex = 0; // Not final, so you can update it

  final List<String> banners = [
    'assets/images/banners/banner1.png',
    'assets/images/banners/banner2.png',
    'assets/images/banners/banner3.png',
  ];

  final List<IconData> categories = [
    Icons.shopping_bag,
    Icons.chair,
    Icons.phone_android,
    Icons.pages_rounded,
    Icons.pets,
    Icons.sports_basketball,
    Icons.watch,
    Icons.computer,
    Icons.kitchen,
    Icons.local_florist,
  ];

  final List<String> categoryNames = [
    'Sports', 'Furniture', 'Electronics', 'Clothes', 'Pets', 'Sports Gear', 'Watches', 'Computers', 'Kitchen', 'Garden'
  ];

  final List<Map<String, dynamic>> newArrivals = [
    {
      'image': 'assets/images/products/newArrivals/newar1.jpg',
      'name': 'Nike Sneakers',
      // 'brand': 'Nike',
      'price': '\$150',
    },
    {
      'image': 'assets/images/products/newArrivals/newar2.jpg',
      'name': 'Adidas Sports Shoe',
      // 'brand': 'Adidas',
      'price': '\$120',
    },
    {
      'image': 'assets/images/products/newArrivals/newar2.jpg',
      'name': 'Adidas Sports Shoe',
      // 'brand': 'Adidas',
      'price': '\$120',
    },
    {
      'image': 'assets/images/products/newArrivals/newar2.jpg',
      'name': 'Adidas Sports Shoe',
      // 'brand': 'Adidas',
      'price': '\$120',
    },
  ];

  final List<Map<String, dynamic>> featuredProducts = [
    {
      'image': 'assets/images/products/featured/feat1.jpg',
      'name': 'Puma Running Shoe',
      // 'brand': 'Puma',
      'price': '\$100',
    },
    {
      'image': 'assets/images/products/featured/feat2.jpg',
      'name': 'Reebok Classic',
      // 'brand': 'Reebok',
      'price': '\$110',
    },
    {
      'image': 'assets/images/products/featured/feat1.jpg',
      'name': 'Puma Running Shoe',
      // 'brand': 'Puma',
      'price': '\$100',
    },
    {
      'image': 'assets/images/products/featured/feat1.jpg',
      'name': 'Puma Running Shoe',
      // 'brand': 'Puma',
      'price': '\$100',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent, // Set the background color here
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              _buildPopularCategories(),
              _buildBodySection(),
            ],
          ),
        ),
      ),
    );
  }

  // Custom App Bar with interactive search field and Cart Button
  Widget _buildAppBar() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20.0), // Further increased height of the app bar
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Good day for shopping,',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Taimoor Sikander',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,  // Semi-bold for the name
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // You can define the onTap logic here if needed (such as opening a search page).
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search in Store',
                      icon: Icon(Icons.search, color: Colors.grey),
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
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
            },
          ),
        ),
      ],
    );
  }

  // Scrollable popular categories section with "Popular Categories" text
  Widget _buildPopularCategories() {
    return Container(
      color: Colors.blue,  // Extend the blue color below categories
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Popular Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 100,  // Adjusted to fit both icons and text
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,  // Circle size remains same
                        child: Icon(categories[index], color: Colors.black, size: 30), // Increased icon size
                      ),
                      const SizedBox(height: 5),
                      Text(
                        categoryNames[index],
                        style: const TextStyle(fontSize: 12, color: Colors.white),
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

  // Body section with rounded edges containing the banners and products
  Widget _buildBodySection() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
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
            _buildNewArrivals(),
            const SizedBox(height: 16),
            _buildFeaturedProducts(),
          ],
        ),
      ),
    );
  }

  // Banner section with smaller size and padding from the sides
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

  // New Arrivals section - scrollable
  Widget _buildNewArrivals() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('New Arrivals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        SizedBox(
          height: 300,  // Set height for the scrollable row
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: newArrivals.length,
            itemBuilder: (context, index) {
              return _buildProductCard(newArrivals[index]);
            },
          ),
        ),
      ],
    );
  }

  // Featured Products section - scrollable
  Widget _buildFeaturedProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Featured Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        SizedBox(
          height: 300,  // Set height for the scrollable row
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featuredProducts.length,
            itemBuilder: (context, index) {
              return _buildProductCard(featuredProducts[index]);
            },
          ),
        ),
      ],
    );
  }

  // Product card builder for both New Arrivals and Featured Products
  Widget _buildProductCard(Map<String, dynamic> product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetail1()));
        },
        child: SizedBox(
          width: 165,  // Adjust width of the card
          child: Card(
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
                      height: 120,  // Increased image size
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
                      // Text(product['brand'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      // const SizedBox(height: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product['price'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: const Icon(Icons.shopping_cart_outlined),
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
