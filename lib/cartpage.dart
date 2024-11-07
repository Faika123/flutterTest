import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Liste pour suivre les éléments sélectionnés
  Map<String, bool> selectedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('cart').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView(
            padding: EdgeInsets.all(16.0),
            children: snapshot.data!.docs.map((doc) {
              double price = double.tryParse(doc['price'].replaceAll("\$", "")) ?? 0.0;
              String docId = doc.id;

              // Initialiser l'état de sélection pour chaque élément
              selectedItems.putIfAbsent(docId, () => false);

              return _buildCartItem(
                docId,
                doc['name'],
                doc['image'],
                price,
                doc['quantity'],
                selectedItems[docId]!,
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget _buildCartItem(String docId, String title, String imagePath, double price, int quantity, bool isSelected) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            onChanged: (bool? value) {
              setState(() {
                selectedItems[docId] = value!;
              });
            },
          ),
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
                    FirebaseFirestore.instance
                        .collection('cart')
                        .doc(docId)
                        .update({'quantity': quantity - 1});
                  } else {
                    _showDeleteConfirmationDialog(docId);
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
                  FirebaseFirestore.instance
                      .collection('cart')
                      .doc(docId)
                      .update({'quantity': quantity + 1});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(String docId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete Item"),
        content: Text("Are you sure you want to delete this item from your cart?"),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text("Delete"),
            onPressed: () {
              FirebaseFirestore.instance.collection('cart').doc(docId).delete();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
