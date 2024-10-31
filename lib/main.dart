import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';
import 'signup.dart';
import 'profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB2nXkFkqvROsDfGnpKyux6jFJ9hygKHhM",
          appId: "com.example.flutter_application_1",
          messagingSenderId: "messagingSenderId",
          projectId: "miniproject-a059a"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
