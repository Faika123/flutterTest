import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api_services.dart';
import 'cartpage.dart';

class ProductPage extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final String price;

  ProductPage({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // final apiServices = ApiServices().getComments();
  bool isCommentsVisible = false; // Track whether comments are visible
  List<dynamic> comments = []; // Store the comments

  // Fetch the comments when button is pressed
  void fetchComments() async {
    try {
      final fetchedComments = await ApiServices().getComments();
      // print(fetchedComments);
      setState(() {
        comments = fetchedComments;
        isCommentsVisible = true; // Make comments visible
      });
    } catch (error) {
      // Handle any errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to load comments")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E8F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
        title: Text(
          "Product",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image and Details
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                widget.price,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 4),
              Text(
                widget.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16),
              Text(
                widget.description,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 16),

              // Button to load comments
              ElevatedButton(
                onPressed: fetchComments,
                child: Text("Show Comments"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                ),
              ),

              // Display Comments Section if visible
              if (isCommentsVisible) ...[
                SizedBox(height: 16),
                Text(
                  "Customer Comments",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),
                // Display comments
                if (comments.isNotEmpty)
                  Column(
                    children: comments.map((comment) {
                      return ListTile(
                        title: Text(
                          comment['name'], // Access 'name' property
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(comment['body']), // Access 'body' property
                      );
                    }).toList(),
                  )
                else
                  Center(child: Text("No comments available")),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// You can use Navigator.push() from another widget or event handler, for example:

void navigateToProductPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductPage(
        image: 'assets/images/test',
        name: 'Sample Product',
        description: 'This is a sample product description.',
        price: '\$29.99',
      ),
    ),
  );
}
