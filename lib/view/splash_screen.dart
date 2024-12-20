import 'package:first_sprint/view/onboard_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to the OnboardingScreen after a 5-second delay
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Theme.of(context)
          .scaffoldBackgroundColor, // Use theme background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(), // Push the logo and text slightly down
          // Logo Image with the theme's primary color for styling
          Image.asset(
            'assets/images/image_2.png', // Replace with your logo path
            height: 220,
          ),
          const SizedBox(height: 20),
          // Title Text with the theme's primary color
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'ENERGIZE ',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3454A4), // Color for "ENERGIZE"
                  ),
                ),
                TextSpan(
                  text: 'NEPAL',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(
                          0xff3454A4) // Use the theme's primary color for "NEPAL"
                      ),
                ),
              ],
            ),
          ),
          const Spacer(), // Push the progress indicator slightly up
          // CircularProgressIndicator styled with the theme's primary color
          const CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Colors.blue), // Match style
          ),
          const SizedBox(height: 60), // Add padding at the bottom
        ],
      ),
    );
  }
}
