import 'package:bank_burgan_flutter/home_page.dart';
import 'package:flutter/material.dart';
import 'package:bank_burgan_flutter/branch_list_page.dart';

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
