import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Burgan Bank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

// Home page widget displaying welcome message and button to explore branches
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Welcome to Burgan Bank',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Burgan Bank logo
            Container(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/628_burgan_bank_logo.jpg',
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
            ),
            // Welcome text
            const Text(
              'our branches across Kuwait!',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Button to navigate to BranchListPage
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BranchListPage()),
                );
              },
              child: const Text('Explore Branches'),
            ),
          ],
        ),
      ),
    );
  }
}

// Page displaying the list of bank branches
class BranchListPage extends StatelessWidget {
  // Sample data for branches
  final List<Map<String, String>> branches = [
    {
      'name': 'Kuwait City Branch',
      'area': 'Kuwait City',
      'address': 'Sharq, Kuwait, Abdullah Al Ahmad Street, Block 1, Plot 22',
      'openingHours': 'Sun-Thur: 8:30 AM - 3 PM',
      'image': 'assets/images/branch_kuwait_city.jpg',
      'contact': 'Phone: 22988669, 22988083, 22988208',
      'services': 'Personal Banking, Business Banking',
    },
    {
      'name': 'Salmiya Branch',
      'area': 'Salmiya',
      'address':
          'Plot 23, Mohamad Abdullah Al Bahar complex, شارع سالم المبارك، السالمية',
      'openingHours': 'Sun-Fri: 9 AM - 5 PM',
      'image': 'assets/images/branch_salmiya.jpg',
      'contact': 'Phone: 1804080',
      'services': 'Personal Banking',
    },
    // Add more branches as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Burgan Bank Branches'), // Title of the Branch List Page
      ),
      body: ListView.builder(
        itemCount: branches.length, // Number of branches to display
        itemBuilder: (context, index) {
          final branch = branches[index]; // Get branch data by index
          return Card(
            margin: EdgeInsets.all(8), // Margin around each card
            child: ListTile(
              title: Text(branch['name']!), // Branch name
              subtitle: Text(branch['area']!), // Branch area
              onTap: () {
                // Navigate to BranchDetailPage on tap
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BranchDetailPage(
                      name: branch['name']!,
                      address: branch['address']!,
                      openingHours: branch['openingHours']!,
                      image: branch['image']!,
                      contact: branch['contact']!,
                      services: branch['services']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Page displaying detailed information about a selected branch
class BranchDetailPage extends StatelessWidget {
  final String name;
  final String address;
  final String openingHours;
  final String image;
  final String contact;
  final String services;

  const BranchDetailPage({
    Key? key,
    required this.name,
    required this.address,
    required this.openingHours,
    required this.image,
    required this.contact,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(name), // Title of the Branch Detail Page
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Branch Image
            Image.asset(
              image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),

            // Location Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Location',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(address), // Display branch address
                  const SizedBox(height: 20),

                  // Opening Hours Section
                  const Text(
                    'Opening Hours',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(openingHours), // Display opening hours
                  const SizedBox(height: 20),

                  // Additional Information Section
                  const Text(
                    'Contact Details',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(contact), // Display contact details
                  const SizedBox(height: 20),

                  const Text(
                    'Services',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(services), // Display services offered
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
