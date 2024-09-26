import 'package:flutter/material.dart';
import '../../widgets/arrow_button.dart';
import '../../widgets/skip_button.dart';
import 'onboarding_screen2.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Skip button at the top right corner
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SkipButton(onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const OnboardingScreen2()),
                  );
                }),
              ],
            ),

            // GIF image in the center
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/gifs/searching.gif',
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
                    "Choose Your Product",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome to a World of Limitless Choices - Your Perfect Product Awaits!",
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const OnboardingScreen2()),
              );
            }),
          ],
        ),
      ),
    );
  }
}
