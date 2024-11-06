import 'package:flutter/material.dart';

void main() => runApp(CartPage());

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Define quantities for each cart item
  int quantityMinimalistChair = 2;
  int quantityElegantWhiteChair = 1;
  int quantityVintageChair = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cart", style: TextStyle(color: Colors.black)),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Color(0xFFF5F5F5), // Light grey background
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cart Items
              Expanded(
                child: ListView(
                  children: [
                    _buildCartItem('Minimalist Chair', 'assets/images/image3.jpg', 235.00, quantityMinimalistChair, (newQuantity) {
                      setState(() {
                        quantityMinimalistChair = newQuantity;
                      });
                    }),
                    _buildCartItem('Elegant White Chair', 'assets/images/image5.jpg', 124.00, quantityElegantWhiteChair, (newQuantity) {
                      setState(() {
                        quantityElegantWhiteChair = newQuantity;
                      });
                    }),
                    _buildCartItem('Vintage Chair', 'assets/images/image4.jpg', 89.00, quantityVintageChair, (newQuantity) {
                      setState(() {
                        quantityVintageChair = newQuantity;
                      });
                    }),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Summary
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    _buildSummaryRow('Selected Items', '\$235.00'),
                    _buildSummaryRow('Shipping Fee', '\$30.00'),
                    Divider(),
                    _buildSummaryRow('Subtotal', '\$265.00', isTotal: true),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Checkout Button
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Checkout',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(String title, String imagePath, double price, int quantity, Function(int) onQuantityChanged) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Checkbox(value: true, onChanged: (value) {}),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  '\$$price',
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  if (quantity > 1) {
                    onQuantityChanged(quantity - 1);
                  }
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$quantity',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  onQuantityChanged(quantity + 1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black : Colors.grey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
