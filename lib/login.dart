import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'profile.dart';
import 'homepage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> login(BuildContext context) async {
    try {
      await users.add({
        'email': emailController.text,
        'password': passwordController.text,
      });
      print("User logged in");
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User successfully logged in')));
      Navigator.of(context).pushNamed("home");

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomePage()),
      // );
    } catch (error) {
      print("Failed to log in user: $error");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to log in user: $error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  "assets/images/image1.jpg",
                  height: 250,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              Text(
                'Sign in to continue',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 201, 202, 204)),
                  prefixIcon: Icon(Icons.email,
                      color: const Color.fromARGB(255, 51, 198, 243)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 198, 199, 201)),
                  prefixIcon: Icon(Icons.lock,
                      color: const Color.fromARGB(255, 44, 186, 241)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    login(context); // Call login function here
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: Text(
                  "Don't have an account? Create a new account",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 10, 10, 10),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
