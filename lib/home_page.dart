import 'package:bank_burgan_flutter/branch_list_page.dart';
import 'package:bank_burgan_flutter/main.dart';
import 'package:flutter/material.dart';

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
