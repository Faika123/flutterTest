import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'home.dart';
import 'profil.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB2nXkFkqvROsDfGnpKyux6jFJ9hygKHhM",
      appId: "com.example.flutter_application_1",
      messagingSenderId: "messagingSenderId",
      projectId: "miniproject-a059a",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furniture Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        // '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
