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
    if (_formKey.currentState!.validate()) {
      // Vérifier que le mot de passe et sa confirmation correspondent
      if (passwordController.text != confirmpasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match')),
        );
        return;
      }

      try {
        await users.add({
          'name': nameController.text,
          'email': emailController.text,
          'password': passwordController.text, // Considérez utiliser Firebase Auth pour gérer les mots de passe
          'phone': phoneController.text,
        });
        print("User Added");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User successfully registered')),
        );
      } catch (error) {
        print("Failed to add user: $error");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add user: $error')),
        );
      }
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
          child: Form(
            key: _formKey, // Utiliser la clé de formulaire ici
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
                TextFormField(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
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
                  validator: (value) {
                    if (value == null || value.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: confirmpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 198, 199, 201)),
                    prefixIcon: Icon(Icons.lock,
                        color: Color.fromARGB(255, 44, 186, 241)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    return null;
                  },
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
      ),
    );
  }
}
