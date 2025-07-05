import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
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

  @override
  void initState() {
    super.initState();
    _ttsHelper = TTSHelper();
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

