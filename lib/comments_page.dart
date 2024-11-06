import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api.dart';

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final ApiServices apiServices = ApiServices();
  List<dynamic> comments = [];

  @override
  void initState() {
    super.initState();
    fetchComments();
  }

  Future<void> fetchComments() async {
    final fetchedComments = await apiServices.getComments();
    setState(() {
      comments = fetchedComments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
        centerTitle: true,
      ),
      body: comments.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return CommentCard(
                  username: comment['name'],
                  email: comment['email'],
                  body: comment['body'],
                );
              },
            ),
    );
  }
}

class CommentCard extends StatelessWidget {
  final String username;
  final String email;
  final String body;

  CommentCard({required this.username, required this.email, required this.body});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              email,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 8),
            Text(
              body,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
