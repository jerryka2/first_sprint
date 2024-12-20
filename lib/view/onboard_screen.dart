import 'package:first_sprint/view/login_screen.dart';
import 'package:first_sprint/view/onboard2_screen.dart';
import 'package:flutter/material.dart';
// Import the theme

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  // Number of pages in the onboarding process
  final int _pageCount = 3;
  final int _currentPage = 0; // Current page index (0 for the first page)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context)
          .scaffoldBackgroundColor, // Use theme background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Row: Logo and Skip
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Skip Button using theme
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context)
                            .primaryColor, // Use primary color from the theme
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Center Image
              Image.asset(
                'assets/images/Onboard_image.png', // Replace with your image path
                height: 200,
              ),

              const SizedBox(height: 30),

              // Title and Subtitle using theme for colors
              const Column(
                children: [
                  Text(
                    'Locate Stations Nearby',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3454A4),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Easily find EV charging stations closest to your location with real-time availability updates.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Dynamic Pagination Indicator using theme for active color
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pageCount, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: _currentPage == index
                          ? Theme.of(context)
                              .primaryColor // Use primary color for active indicator
                          : Colors.grey,
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              // Next Button using the theme
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OnboardingScreen2()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context)
                        .primaryColor, // Use primary color from the theme
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10), // Safe space at bottom
            ],
          ),
        ),
      ),
    );
  }
}
