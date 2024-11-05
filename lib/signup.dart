import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignupScreen();
  }
}

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() async {
    try {
      await users.add({
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'phone': phoneController.text,
        'address': confirmpasswordController.text,
      });
      print("User Added");
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User successfully registered')));
    } catch (error) {
      print("Failed to add user: $error");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to add user: $error')));
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(221, 1, 11, 51),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                "Create a new account",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 47, 47, 47),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 198, 199, 201)),
                  prefixIcon: Icon(Icons.person,
                      color: Color.fromARGB(255, 44, 186, 241)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 198, 199, 201)),
                  prefixIcon: Icon(Icons.email,
                      color: Color.fromARGB(255, 44, 186, 241)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: "Phone",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 198, 199, 201)),
                  prefixIcon: Icon(Icons.phone,
                      color: Color.fromARGB(255, 44, 186, 241)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 198, 199, 201)),
                  prefixIcon: Icon(Icons.lock,
                      color: Color.fromARGB(255, 44, 186, 241)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: confirmpasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "confirmer password",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 198, 199, 201)),
                  prefixIcon: Icon(Icons.lock,
                      color: Color.fromARGB(255, 44, 186, 241)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  addUser(); // Appelle la méthode pour ajouter un utilisateur
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 10, 86, 149),
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
                    color: Color.fromARGB(255, 53, 52, 52),
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
