// community.dart

import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true, // Corrected to boolean
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Learn Stock, Educate the World',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              textAlign: TextAlign.start, // Corrected property name
              decoration: InputDecoration(
                hintText: 'Search something...',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  CommunityCard(
                    title: 'How to Start Investing in uStock',
                    description: 'Lemme tell you this, world of investing is really legit...',
                    participants: [
                      'assets/images/user1.png',
                      'assets/images/user2.png',
                      'assets/images/user3.png'
                    ],
                  ),
                  SizedBox(height: 20),
                  CommunityCard(
                    title: 'How to Predict the Candlestick',
                    description: 'What is candlestick? It\'s like a candle but not...',
                    participants: [
                      'assets/images/user1.png',
                      'assets/images/user2.png',
                      'assets/images/user3.png'
                    ],
                  ),
                  SizedBox(height: 20),
                  CommunityCard(
                    title: 'Is Trading Safe for Newbie Investors?',
                    description: 'Many people ask us about trading in uStock...',
                    participants: [
                      'assets/images/user1.png',
                      'assets/images/user2.png',
                      'assets/images/user3.png'
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> participants;

  CommunityCard({
    required this.title,
    required this.description,
    required this.participants,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 10),
                Row(
                  children: participants
                      .map((participant) => Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(participant),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEFF1F3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Join Forum',
                  style: TextStyle(color: Colors.black),
                ),
                Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
