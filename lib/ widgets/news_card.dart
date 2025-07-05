import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final Map<String, dynamic> article;
  NewsCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(article['image_url'], width: 100, fit: BoxFit.cover),
        title: Text(article['title']),
        subtitle: Text(article['description'] ?? ''),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            // Handle "Read more"
          },
        ),
      ),
    );
  }
}

