import 'package:flutter/material.dart';
import 'login.dart'; // Login page import

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let’s create your account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // First and Last name
              const Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'First Name'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Last Name'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Username, E-Mail, Phone Number
              const TextField(
                decoration: InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(labelText: 'E-Mail'),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              const SizedBox(height: 20),

              // Password
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              const SizedBox(height: 20),

              // Privacy Policy Checkbox
              Row(
                children: [
                  Checkbox(value: true, onChanged: (bool? value) {}),
                  const Text("I agree to Privacy Policy and Terms of use"),
                ],
              ),
              const SizedBox(height: 20),

              // Create Account button
              ElevatedButton(
                onPressed: () {
                  // Navigate back to LoginScreen after account creation
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Create Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
