import 'package:flutter/material.dart';
import '../widgets/news_card.dart';
import '../services/news_api.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SmartNewsDaily')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchNewsArticles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (!snapshot.hasData || snapshot.data!.isEmpty)
            return Center(child: Text('No news found'));
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => NewsCard(article: snapshot.data![index]),
          );
        },
      ),
    );
  }
}

