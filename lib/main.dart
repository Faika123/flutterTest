import 'package:flutter/material.dart';
import 'login.dart'; // Import your LoginPage file
import 'pagesigneup.dart'; // Import your SignUpPage file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login & Sign Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Set the LoginPage as the home screen
      routes: {
        '/signup': (context) => SignUpPage(), // Define route for SignUpPage
        '/login': (context) => LoginPage(), // Add route for LoginPage if needed
      },
    );
  }
}
