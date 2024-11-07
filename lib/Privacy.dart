import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PrivacyPage extends StatelessWidget {
  final String username;
  final String email;

  const PrivacyPage({super.key, required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Header
            Text(
              'Manage Privacy Settings',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            const SizedBox(height: 20),

            // Username Update Card
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.blue),
                title: const Text('Username'),
                subtitle: Text(username),
                trailing: const Icon(Icons.edit, color: Colors.grey),
                onTap: () {
                  // Handle username update
                },
              ),
            ),

            // Email Update Card
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.blue),
                title: const Text('Email Address'),
                subtitle: Text(email),
                trailing: const Icon(Icons.edit, color: Colors.grey),
                onTap: () {
                  // Handle email update
                },
              ),
            ),

            // Password Update Card
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: const Icon(Icons.lock, color: Colors.blue),
                title: const Text('Password'),
                subtitle: const Text('••••••••'),
                trailing: const Icon(Icons.edit, color: Colors.grey),
                onTap: () {
                  // Handle password update
                },
              ),
            ),

            // Account Deactivation
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              color: Colors.red[50],
              child: ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Deactivate Account'),
                subtitle: const Text('Temporarily deactivate your account'),
                trailing: const Icon(Icons.chevron_right, color: Colors.red),
                onTap: () {
                  // Handle account deactivation
                },
              ),
            ),

            // Account Deletion
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              color: Colors.red[50],
              child: ListTile(
                leading: const Icon(Icons.close, color: Colors.red),
                title: const Text('Delete Account'),
                subtitle: const Text('Permanently delete your account'),
                trailing: const Icon(Icons.chevron_right, color: Colors.red),
                onTap: () {
                  // Handle account deletion
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
