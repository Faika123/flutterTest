import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/services/api_services.dart';

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
  final ApiServices apiService = ApiServices(); // Create instance of ApiServices
  List<dynamic> apiData = []; // Variable to hold API data

  Future<void> addUser() async {
    if (_formKey.currentState!.validate()) {
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
          'password': passwordController.text,
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

  Future<void> fetchApiData() async {
    try {
      List<dynamic> data = await apiService.getRequest();
      setState(() {
        apiData = data; // Save data to display
      });
    } catch (error) {
      print("Failed to start API: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to start API: $error')),
      );
    }
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
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Existing sign-up form fields...
                ElevatedButton(
                  onPressed: addUser,
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
                ElevatedButton(
                  onPressed: fetchApiData, // Call fetchApiData on button press
                  child: Text("start API Data"),
                ),
                SizedBox(height: 20),
                apiData.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: apiData.map((post) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "Title: ${post['title']}",
                              style: TextStyle(fontSize: 14),
                            ),
                          );
                        }).toList(),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
