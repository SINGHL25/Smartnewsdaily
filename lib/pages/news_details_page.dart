import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/tts_helper.dart';

class NewsDetailsPage extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String url;

  const NewsDetailsPage({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
  });

  @override
  _NewsDetailsPageState createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  late final TTSHelper _ttsHelper;
  bool isBookmarked = false;

  final user = FirebaseAuth.instance.currentUser;
  final CollectionReference favRef = FirebaseFirestore.instance.collection('favorites');

  @override
  void initState() {
    super.initState();
    _ttsHelper = TTSHelper();
    _checkIfBookmarked();
  }

  void _checkIfBookmarked() async {
    if (user == null) return;
    final snapshot = await favRef
        .doc(user!.uid)
        .collection("articles")
        .where("url", isEqualTo: widget.url)
        .limit(1)
        .get();
    setState(() {
      isBookmarked = snapshot.docs.isNotEmpty;
    });
  }

  void _toggleBookmark() async {
    if (user == null) return;

    final articleRef = favRef.doc(user!.uid).collection("articles");

    if (isBookmarked) {
      final toRemove = await articleRef.where("url", isEqualTo: widget.url).get();
      for (var doc in toRemove.docs) {
        await doc.reference.delete();
      }
      setState(() => isBookmarked = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Removed from favorites")));
    } else {
      await articleRef.add({
        "title": widget.title,
        "description": widget.description,
        "imageUrl": widget.imageUrl,
        "url": widget.url,
        "savedAt": DateTime.now(),
      });
      setState(() => isBookmarked = true);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added to favorites")));
    }
  }

  @override
  void dispose() {
    _ttsHelper.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.volume_up),
            onPressed: () => _ttsHelper.speak(widget.title + ". " + widget.description),
          ),
          IconButton(
            icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border),
            onPressed: _toggleBookmark,
          ),
        ],
      ),
      body: Column(
        children: [
          Image.network(widget.imageUrl, fit: BoxFit.cover, height: 200),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(widget.title,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center),
          ),
          Expanded(
            child: WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
    );
  }
}
