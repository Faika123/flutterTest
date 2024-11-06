import 'package:flutter/material.dart';
import 'login.dart';
import 'profile.dart';
import 'productpage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> items = [
    {
      'image': 'images/image3.jpg',
      'name': 'Item name 1',
      'description': 'Description 1',
      'price': '\$250.00',
    },
    {
      'image': 'images/image4.jpg',
      'name': 'Item name 2',
      'description': 'Description 2',
      'price': '\$115.00',
    },
    {
      'image': 'images/image5.jpg',
      'name': 'Item name 3',
      'description': 'Description 3',
      'price': '\$125.00',
    },
    {
      'image': 'images/image6.jpg',
      'name': 'Item name 4',
      'description': 'Description 4',
      'price': '\$140.00',
    },
    {
      'image': 'images/image7.jpg',
      'name': 'Item name 5',
      'description': 'Description 5',
      'price': '\$160.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 247, 247),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 247, 247),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notification_add, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage(userData: {},)),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              const SizedBox(height: 24),
              const Text(
                "Explore",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: items.map((item) => _buildCard(item)).toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Best Selling",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildBestSellingCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildCard(Map<String, String> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              image: item['image']!,
              name: item['name']!,
              description: item['description']!,
              price: item['price']!,
            ),
          ),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    item['image']!,
                    fit: BoxFit.cover,
                    height: 120,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item['description']!,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item['price']!,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Icon(
                    Icons.add_circle,
                    color: Color.fromARGB(255, 0, 13, 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBestSellingCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'images/image3.jpg',
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Minimal Chair',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                'Lorem Ipsum',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Text(
                '\$125.00',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}