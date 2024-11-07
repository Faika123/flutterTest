import 'package:flutter/material.dart';
import 'privacy.dart'; // Import PrivacyPage
import 'notifications.dart'; // Import NotificationsPage
import 'language_settings.dart'; // Import LanguageSettingsPage

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: const Color.fromARGB(255, 9, 235, 235),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text(
              "Notifications",
              style: TextStyle(fontWeight: FontWeight.bold), // Bold text
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to NotificationsPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationsPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text(
              "Privacy",
              style: TextStyle(fontWeight: FontWeight.bold), // Bold text
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to PrivacyPage with arguments
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrivacyPage(
                    username: 'Mariem Ch', // Pass the username
                    email: 'mariemcharfii@gmail.com', // Pass the email
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text(
              "Language",
              style: TextStyle(fontWeight: FontWeight.bold), // Bold text
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to LanguageSettingsPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LanguageSettingsPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text(
              "About",
              style: TextStyle(fontWeight: FontWeight.bold), // Bold text
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Handle about settings tap
            },
          ),
        ],
      ),
    );
  }
}
