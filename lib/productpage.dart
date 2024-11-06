import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api.dart';
import 'cartpage.dart';
import 'comments_page.dart';

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
  final ApiServices apiServices = ApiServices();

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
              // Détails du produit
              Stack(
                children: [
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
                  Positioned(
                    right: 16,
                    top: 16,
                    child: Row(
                      children: [
                        // Bouton favori
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(width: 8),
                        // Icône de feedback
                        IconButton(
                          icon: Icon(Icons.feedback, color: Colors.blue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CommentsPage()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
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
              
              // Row pour le nom et les étoiles
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Nom du produit
                  Expanded(
                    child: Text(
                      widget.name,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Évaluation
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < 4 ? Icons.star : Icons.star_half,
                        color: Colors.amber,
                        size: 20,
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "Color option",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  ColorOption(Colors.red),
                  SizedBox(width: 8),
                  ColorOption(Colors.black),
                  SizedBox(width: 8),
                  ColorOption(Colors.blueGrey),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                widget.description,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: Icon(Icons.add, color: Colors.white),
                  label: Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorOption extends StatelessWidget {
  final Color color;
  ColorOption(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey),
      ),
    );
  }
}
