import 'package:flutter/material.dart';
import '../../main.dart';
import '../../theme/theme.dart';
import 'edit_profile.dart'; // Make sure EditProfilePage exists

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isDarkTheme = false; // For the theme toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 160, // Increased height for the AppBar
        backgroundColor: _isDarkTheme ? Colors.grey[900] : Colors.blueAccent, // Change AppBar color based on theme
        flexibleSpace: _buildHeader(), // Custom header with profile info
      ),
      body: Column(
        children: [
          const SizedBox(height: 0), // Add some space

          // Reintroducing Account Settings section with regular background color
          _buildAccountSettings(),

          const SizedBox(height: 20), // Add more space

          // Toggle button directly below the list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListTile(
              leading: const Icon(Icons.brightness_6),
              title: const Text('Dark Mode'),
              trailing: Switch(
                activeColor: _isDarkTheme ? Colors.white : Theme.of(context).primaryColor, // White in dark mode
                value: _isDarkTheme,
                onChanged: (value) {
                  setState(() {
                    _isDarkTheme = value; // Update the state
                    _changeTheme(); // Call the function to change the theme globally
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 20), // Add more space

          // Updated Logout button with increased width
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity, // Full width for the button
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
                    color: _isDarkTheme ? Colors.white : Colors.black,
                    width: 1,
                  ),
                  backgroundColor: _isDarkTheme ? Colors.black : Colors.white,
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: _isDarkTheme ? Colors.white : Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Profile Picture, Name, Email, and Edit Button in the App Bar (Blue or Dark Ash Section)
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20.0), // Add padding around the content
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end, // Align content at the bottom of AppBar
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 45, // Larger profile picture size
                    backgroundImage: AssetImage('assets/images/profile/profile.png'), // Profile picture
                  ),
                  const SizedBox(width: 20), // Space between image and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hannan Munas',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold, // Bold name
                          color: Colors.white, // Text color stays white in both modes
                        ),
                      ),
                      Text(
                        'CB011253@Students.apiit.lk',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70, // Email color remains light
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.white), // Icon color stays white
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditProfilePage()), // Navigate to EditProfilePage
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Account Settings List with regular color scheme
  Widget _buildAccountSettings() {
    return Container(
      decoration: BoxDecoration(
        color: _isDarkTheme ? Colors.black : Colors.white, // Background color for Account Settings
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
              color: _isDarkTheme ? Colors.white : Colors.black, // Text color adapts to theme
            ),
          ),
          const SizedBox(height: 10),
          // Updated list items
          _buildListTile(Icons.shopping_cart, 'My Cart', 'Add, remove products and move to checkout'),
          _buildListTile(Icons.list, 'My Orders', 'In-progress and completed orders'),
          _buildListTile(Icons.notifications, 'Notifications', 'Set notifications preferences'),
          _buildListTile(Icons.local_offer, 'My Coupons', 'Manage your coupons'),
          _buildListTile(Icons.privacy_tip, 'Account Privacy', 'Manage privacy and security settings'),
        ],
      ),
    );
  }

  // ListTile builder for reusability
  Widget _buildListTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: _isDarkTheme ? Colors.white : Colors.black), // Icon color adapts to theme
      title: Text(
        title,
        style: TextStyle(color: _isDarkTheme ? Colors.white : Colors.black), // Text color adapts to theme
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: _isDarkTheme ? Colors.white70 : Colors.black54), // Subtitle adapts to theme
      ),
    );
  }

  // Change Theme Function
  void _changeTheme() {
    if (_isDarkTheme) {
      MyApp.of(context)?.setTheme(AppTheme.darkTheme); // Switch to dark theme
    } else {
      MyApp.of(context)?.setTheme(AppTheme.lightTheme); // Switch to light theme
    }
  }
}
