import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsPage extends StatelessWidget {
  final List<String> notifications = [
    "New comment on your post",
    "You have a new follower",
    "Update available for the app",
    "Reminder: Meeting at 10 AM tomorrow",
    "Your password was changed successfully"
  ];

   NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(notifications[index]),
              subtitle: const Text("Just now"), // You could replace this with actual timestamps
              leading: const Icon(Icons.notifications, color: Colors.blue),
              onTap: () {
                // Handle the tap event, navigate to notification details if needed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationDetailPage(notification: notifications[index]),
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

class NotificationDetailPage extends StatelessWidget {
  final String notification;

  const NotificationDetailPage({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Details"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              "Details about this notification would go here.",
              style: TextStyle(fontSize: 16),
            ),
            // Additional details can be added here
          ],
        ),
      ),
    );
  }
}
