import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignupScreen();
  }
}

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(221, 1, 11, 51),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                "Create a new account",
                style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 47, 47, 47),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 198, 199, 201)),
                  prefixIcon: Icon(Icons.person,
                      color: const Color.fromARGB(255, 44, 186, 241)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 198, 199, 201)),
                  prefixIcon: Icon(Icons.email,
                      color: const Color.fromARGB(255, 44, 186, 241)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: "Phone",
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 198, 199, 201)),
                  prefixIcon: Icon(Icons.phone,
                      color: const Color.fromARGB(255, 44, 186, 241)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 15),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 198, 199, 201)),
                  prefixIcon: Icon(Icons.lock,
                      color: const Color.fromARGB(255, 44, 186, 241)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 198, 199, 201)),
                  prefixIcon: Icon(Icons.lock,
                      color: const Color.fromARGB(255, 44, 186, 241)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  // Add Signup functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 10, 86, 149),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "CREATE ACCOUNT",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  "Already have an account? Login",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 53, 52, 52),
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