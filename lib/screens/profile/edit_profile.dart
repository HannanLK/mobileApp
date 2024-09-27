import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text('This is where you can edit your profile!', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
