import 'package:flutter/material.dart';
import '../../widgets/arrow_button.dart';
import 'login.dart'; // Import the login screen

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            // GIF image in the center
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/gifs/delivery.gif',
                  height: 300, // Adjust the height according to your design
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Text content below the GIF
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Text(
                    "Deliver At Your Door Step",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "From Our Doorstep to Yours - Swift, Secure, and Contactless Delivery!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Next button at the bottom right corner
            ArrowButton(onPressed: () {
              // Navigate to Login Page instead of HomePage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()), // Move to LoginScreen
              );
            }),
          ],
        ),
      ),
    );
  }
}
