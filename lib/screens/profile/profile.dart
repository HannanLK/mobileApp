import 'package:flutter/material.dart';
import '../../main.dart';
import '../../widgets/bottomnav.dart';
import 'edit_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3; // Set ProfilePage as selected

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/store');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/wishlist');
        break;
      case 3:
      // Already on profile page
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 160,
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.blueAccent, // Dark grey for dark mode, blue for light mode
        flexibleSpace: _buildHeader(),
      ),
      body: Column(
        children: [
          const SizedBox(height: 0),
          _buildAccountSettings(),
          const SizedBox(height: 20),

          // Toggle button for Dark Mode
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListTile(
              leading: const Icon(Icons.brightness_6),
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  if (value) {
                    MyApp.of(context)?.setTheme(ThemeMode.dark); // Switch to dark mode
                  } else {
                    MyApp.of(context)?.setTheme(ThemeMode.light); // Switch to light mode
                  }
                },
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Updated Logout button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  print('User logged out');
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(
                    color: isDarkMode ? Colors.white : Colors.black,
                    width: 1,
                  ),
                  backgroundColor: isDarkMode ? Colors.black : Colors.white,
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  // Profile Header with Picture and Edit Button
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/images/profile/profile.png'),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hannan Munas',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'CB011253@Students.apiit.lk',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditProfilePage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Account Settings List
  Widget _buildAccountSettings() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Settings',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 10),
          _buildListTile(Icons.shopping_cart, 'My Cart', 'Add, remove products and move to checkout'),
          _buildListTile(Icons.list, 'My Orders', 'In-progress and completed orders'),
          _buildListTile(Icons.notifications, 'Notifications', 'Set notifications preferences'),
          _buildListTile(Icons.local_offer, 'My Coupons', 'Manage your coupons'),
          _buildListTile(Icons.privacy_tip, 'Account Privacy', 'Manage privacy and security settings'),
        ],
      ),
    );
  }

  // ListTile builder
  Widget _buildListTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).iconTheme.color),
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
      ),
    );
  }
}
