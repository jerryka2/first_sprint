import 'package:flutter/material.dart';

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
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: 20,
            child: const Icon(Icons.person, color: Colors.black),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, Customer',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Welcome to Energize Nepal',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text(
              'Find nearby station',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
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
            const SizedBox(height: 20),
            const Text(
              'Our Brands',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Evenly space buttons
              children: [
                _brandButton(context, 'MG',
                    'assets/images/mg-logo-2021-present-1024x742 1.png'),
                _brandButton(context, 'TATA',
                    'assets/images/Screenshot 2024-11-28 125612 1.png'),
                _brandButton(context, 'BYD',
                    'assets/images/byd-brand-logo-symbol-name-black-design-car-china-vector-45976095 1.png'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Popular Stations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child:
                        _stationCard(context, 'Electra Station', 'Available')),
                const SizedBox(width: 10), // Added space between cards
                Expanded(
                    child:
                        _stationCard(context, 'Electra Station', 'Available')),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomNavItem(context, Icons.home, 'Home', 0),
            _bottomNavItem(context, Icons.location_on, 'Location', 1),
            _bottomNavItem(context, Icons.qr_code_scanner, 'Payment', 2),
            _bottomNavItem(context, Icons.favorite, 'Favorite', 3),
            _bottomNavItem(context, Icons.settings, 'Setting', 4),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavItem(
      BuildContext context, IconData iconData, String label, int index) {
    final isSelected = _currentIndex == index; // Check if this item is selected
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          iconSize: 30,
          icon: Icon(iconData,
              color: isSelected
                  ? Colors.green
                  : Colors.grey), // Change color based on selection
          onPressed: () {
            setState(() {
              _currentIndex = index; // Update the selected index
              if (index != 0) {
                // Show SnackBar for non-home items
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text('$label feature coming soon!')));
              }
            });
          },
        ),
        Text(label,
            style: TextStyle(
                color: isSelected
                    ? Colors.green
                    : Colors.grey)), // Change label color based on selection
      ],
    );
  }

  Widget _brandButton(
      BuildContext context, String brandName, String imagePath) {
    return GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 1),
            content: Text('$brandName brand feature coming soon!'),
          ));
        },
        child: Column(children: [
          Container(
              padding: const EdgeInsets.all(
                  16), // Increased padding for larger button
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200]),
              child: Image.asset(imagePath,
                  height: 70, width: 70) // Increased image size
              ),
          const SizedBox(height: 5),
          Text(brandName,
              style: const TextStyle(
                  fontSize: 16)) // Increased font size for better visibility
        ]));
  }

  Widget _stationCard(BuildContext context, String stationName, String status) {
    return GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 1),
              content: Text('$stationName station details coming soon!')));
        },
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset('assets/images/img-13-scaled 1.png',
                  height: 100, width: double.infinity, fit: BoxFit.cover),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(stationName,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Text(status,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.green))
                      ]))
            ])));
  }
}
