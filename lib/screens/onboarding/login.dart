import 'package:flutter/material.dart';
import '../home/home_page.dart'; // Import HomePage
import 'register.dart'; // Import the registration page

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                "Welcome back,",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Discover Limitless Choices and Unmatched Convenience.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // E-Mail field
              const TextField(
                decoration: InputDecoration(
                  labelText: 'E-Mail',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),

              // Password field
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (bool? value) {}),
                      const Text("Remember Me"),
                    ],
                  ),
                  const Text("Forgot Password?", style: TextStyle(color: Colors.blue)),
                ],
              ),

              const SizedBox(height: 20),

              // Next button to go to HomePage after login
              ElevatedButton(
                onPressed: () {
                  // Navigate to HomePage after login
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                },
                child: const Text("Next"), // Use "Next" instead of "Sign In"
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),

              // Create Account
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    const Text("Not a user yet?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                      },
                      child: const Text("Create Account"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
