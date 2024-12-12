import 'package:first_sprint/view/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(), // Push the logo and text slightly down
          Image.asset(
            'assets/images/image_2.png', // Replace with your logo path
            height: 220,
          ),
          const SizedBox(height: 20),
          const Text(
            'ENERGIZE NEPAL',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color:
                  Color.fromARGB(255, 102, 141, 209), // Use a dark text color
            ),
          ),
          const Spacer(), // Push the progress indicator slightly up
          const CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Colors.blue), // Match style
          ),
          const SizedBox(height: 60), // Add padding at the bottom
        ],
      ),
      backgroundColor: const Color.fromARGB(
          255, 255, 255, 255), // Ensure a clean white background
    );
  }
}
