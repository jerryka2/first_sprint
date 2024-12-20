import 'package:first_sprint/view/location_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart'; // <-- Add this import to your code

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0; // To track the currently selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row with user greeting and CircleAvatar for profile options
              Row(
                children: [
                  Text(
                    'Hello, Customer',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 24),
                  ),
                  const Spacer(),
                  PopupMenuButton<String>(
                    icon: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 20,
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    onSelected: (value) {
                      if (value == 'logout') {
                        _showLogoutDialog(context);
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem<String>(
                          value: 'logout',
                          child: Text('Logout'),
                        ),
                      ];
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Welcome to Energize Nepal',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              Text(
                'Find nearby station',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        border: Theme.of(context).inputDecorationTheme.border,
                        enabledBorder: Theme.of(context)
                            .inputDecorationTheme
                            .enabledBorder,
                        focusedBorder: Theme.of(context)
                            .inputDecorationTheme
                            .focusedBorder,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Filter feature coming soon!'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.filter_list),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Our Brands',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              // "Our Brands" section with brand logos and labels
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _brandButton(
                    context,
                    'MG',
                    'assets/images/mg-logo-2021-present-1024x742 1.png',
                    'MG',
                  ),
                  _brandButton(
                    context,
                    'TATA',
                    'assets/images/Screenshot 2024-11-28 125612 1.png',
                    'TATA',
                  ),
                  _brandButton(
                    context,
                    'BYD',
                    'assets/images/byd-brand-logo-symbol-name-black-design-car-china-vector-45976095 1.png',
                    'BYD',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Popular Stations',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child:
                        _stationCard(context, 'Electra Station', 'Available'),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child:
                        _stationCard(context, 'Electra Station', 'Available'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomNavItem(context, Icons.home, 'Home', 0),
            _bottomNavItem(context, Icons.location_on, 'Location', 1),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey[200],
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(
                    Icons.qr_code_scanner,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
            _bottomNavItem(context, Icons.favorite, 'Favorite', 3),
            _bottomNavItem(context, Icons.settings, 'Setting', 4),
          ],
        ),
      ),
    );
  }

  // Method to show logout confirmation dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Navigate to the login screen after logout
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logged out successfully!')),
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  // Other methods (like _bottomNavItem, _stationCard, etc.) remain unchanged...

  Widget _bottomNavItem(
    BuildContext context,
    IconData iconData,
    String label,
    int index,
  ) {
    final isSelected = _currentIndex == index;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          iconSize: 30,
          icon: Icon(
            iconData,
            color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(builder: (context) => const LocationScreen()),
            );
            setState(() {
              _currentIndex = index;
              // Show SnackBar for features that are not implemented yet
              if (index != 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text('$label feature coming soon!'),
                  ),
                );
              }
            });
          },
        ),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _brandButton(
      BuildContext context, String brandName, String imagePath, String label) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text('$brandName brand feature coming soon!'),
          ),
        );
      },
      child: Column(
        children: [
          // Brand Image
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: Image.asset(
              imagePath,
              height: 70,
              width: 70,
            ),
          ),
          const SizedBox(height: 10),
          // Brand Name Label
          Text(
            label, // Display brand label below the logo
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }

  Widget _stationCard(BuildContext context, String stationName, String status) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text('$stationName station details coming soon!'),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/img-13-scaled 1.png',
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stationName,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    status,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
