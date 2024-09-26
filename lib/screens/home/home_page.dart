import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isWishlisted = false;
  int currentBannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting and Notification
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good day for shopping",
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                        Text("Taimoor Sikander",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Icon(Icons.notifications, color: Colors.grey),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search in Store",
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),
              ),

              // Popular Categories (Scrollable)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Text("Popular Categories",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12, // Total categories
                  itemBuilder: (context, index) {
                    return CategoryIcon(
                      iconPath: 'assets/icons/icon${index + 1}.png',
                      label: "Category ${index + 1}",
                    );
                  },
                ),
              ),

              // Banner Section (Sliding)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 180,
                      child: PageView.builder(
                        itemCount: 3, // Total banner images
                        onPageChanged: (index) {
                          setState(() {
                            currentBannerIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage('assets/images/banners/banner${index + 1}.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) => buildDot(index, context)),
                    ),
                  ],
                ),
              ),

              // New Arrivals Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("New Arrivals", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    TextButton(onPressed: () {}, child: const Text("View All")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 per row
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: 4, // 4 New Arrival products
                  itemBuilder: (context, index) {
                    return ProductCard(
                      imagePath: 'assets/images/home/product${index + 1}.png', // New Arrivals images
                      discount: "${10 + (index * 10)}%",
                      isWishlisted: isWishlisted,
                      onWishlistToggle: () {
                        setState(() {
                          isWishlisted = !isWishlisted;
                        });
                      },
                    );
                  },
                ),
              ),

              // Featured Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Featured", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    TextButton(onPressed: () {}, child: const Text("View All")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 per row
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: 4, // 4 Featured products
                  itemBuilder: (context, index) {
                    return ProductCard(
                      imagePath: 'assets/images/home/product${index + 5}.png', // Featured images
                      discount: "${10 + (index * 10)}%",
                      isWishlisted: isWishlisted,
                      onWishlistToggle: () {
                        setState(() {
                          isWishlisted = !isWishlisted;
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Store"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Wishlist"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  // Dot indicator for PageView (banner slider)
  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: 8,
      width: currentBannerIndex == index ? 20 : 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: currentBannerIndex == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final String iconPath;
  final String label;

  const CategoryIcon({super.key, required this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset(iconPath),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String discount;
  final bool isWishlisted;
  final VoidCallback onWishlistToggle;

  const ProductCard({super.key, required this.imagePath, required this.discount, required this.isWishlisted, required this.onWishlistToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(imagePath)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("$discount Off", style: const TextStyle(color: Colors.red)),
                const Spacer(),
                GestureDetector(
                  onTap: onWishlistToggle,
                  child: Icon(
                    isWishlisted ? Icons.favorite : Icons.favorite_border,
                    color: isWishlisted ? Colors.red : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
