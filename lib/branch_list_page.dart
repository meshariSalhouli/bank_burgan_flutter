import 'package:bank_burgan_flutter/main.dart';
import 'package:flutter/material.dart';

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
