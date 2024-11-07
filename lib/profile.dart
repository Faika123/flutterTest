import 'package:flutter/material.dart';
import 'personaldata.dart';
import 'community.dart';
import 'cartpage.dart';
import 'settings.dart'; // Import SettingsPage

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/image9.jpg'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Charfi Mariem',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Aggressive Investor',
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
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text.rich(
                TextSpan(
                  text: 'Personal Data',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalDataPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart),
              title: const Text.rich(
                TextSpan(
                  text: 'Add product',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text.rich(
                TextSpan(
                  text: 'Settings',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.document_scanner),
              title: const Text.rich(
                TextSpan(
                  text: 'E-Statement',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text.rich(
                TextSpan(
                  text: 'Referral Code',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text.rich(
                TextSpan(
                  text: 'FAQs',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text.rich(
                TextSpan(
                  text: 'Our Handbook',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text.rich(
                TextSpan(
                  text: 'Community',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommunityPage(),
                  ),
                );
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue[100],
                ),
                onPressed: () {},
                child: Text(
                  "Feel Free to Ask, We’re Ready to Help",
                  style: TextStyle(color: const Color.fromARGB(255, 4, 3, 68)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
