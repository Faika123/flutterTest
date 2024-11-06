import 'package:flutter/material.dart';
import 'personaldata.dart';
import 'community.dart';
import 'cartpage.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> userData; // Accept user data

  ProfilePage({required this.userData}); // Constructor to accept user data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/image2.jpg'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userData['name'] ?? 'User Name', // Display user's name
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userData['role'] ?? 'User Role', // Display user's role
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            _buildListTile(
              context,
              icon: Icons.person,
              title: 'Personal Data',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalDataPage(userData: userData, userId: '',), // Pass user data to PersonalDataPage
                  ),
                );
              },
            ),
            _buildListTile(
              context,
              icon: Icons.add_shopping_cart,
              title: 'Add Product',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
            ),
            _buildListTile(
              context,
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                // Placeholder for settings functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Settings functionality not implemented yet.')),
                );
              },
            ),
            _buildListTile(
              context,
              icon: Icons.document_scanner,
              title: 'E-Statement',
              onTap: () {
                // Placeholder for e-statement functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('E-Statement functionality not implemented yet.')),
                );
              },
            ),
            _buildListTile(
              context,
              icon: Icons.code,
              title: 'Referral Code',
              onTap: () {
                // Placeholder for referral code functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Referral Code functionality not implemented yet.')),
                );
              },
            ),
            _buildListTile(
              context,
              icon: Icons.help,
              title: 'FAQs',
              onTap: () {
                // Placeholder for FAQs functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('FAQs functionality not implemented yet.')),
                );
              },
            ),
            _buildListTile(
              context,
              icon: Icons.book,
              title: 'Our Handbook',
              onTap: () {
                // Placeholder for handbook functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Handbook functionality not implemented yet.')),
                );
              },
            ),
            _buildListTile(
              context,
              icon: Icons.group,
              title: 'Community',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommunityPage(),
                  ),
                );
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.blue[100],
                ),
                onPressed: () {
                  // Placeholder for help functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Help functionality not implemented yet.')),
                  );
                },
                child: Text(
                  "Feel Free to Ask, We’re Ready to Help",
                  style: TextStyle(color: Colors.blue[900]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a ListTile for cleaner code
  Widget _buildListTile(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
