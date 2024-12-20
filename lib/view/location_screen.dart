import 'package:first_sprint/view/dashboard_screen.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
            ); // Navigate back to the previous screen
          },
        ),
      ),
      body: const Center(
        child: Text(
          'This is the Location Screen',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
