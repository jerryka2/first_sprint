import 'package:first_sprint/view/login_screen.dart';
import 'package:first_sprint/view/onboard3_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  // Number of pages in the onboarding process
  final int _pageCount = 3;
  final int _currentPage =
      2; // Second page, update this as per current screen index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Row: Back Button and Skip Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.grey),
                    onPressed: () {
                      Navigator.pop(
                          context); // Navigate back to the previous screen
                    },
                  ),
                  // Skip Button
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Center Image
              Image.asset(
                'assets/images/Onboard_image1.png', // Replace with your image
                height: 200,
              ),

              const SizedBox(height: 30),

              // Title and Subtitle
              const Column(
                children: [
                  Text(
                    'Easy Payments for Your EV',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 102, 141, 209),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Secure and hassle-free payment options for your charging sessions.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Dynamic Pagination Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pageCount, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: _currentPage == (index + 1)
                          ? Colors.greenAccent
                          : Colors.grey,
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OnboardingScreen3()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
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
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
