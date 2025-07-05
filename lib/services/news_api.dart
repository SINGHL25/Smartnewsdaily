Future<List<Map<String, dynamic>>> fetchNewsArticles() async {
  // Simulate API
  await Future.delayed(Duration(seconds: 1));
  return [
    {
      "title": "AI Takes Over the News World",
      "description": "Automated journalism is here.",
      "image_url": "https://via.placeholder.com/150",
      "category": "Tech",
      "url": "https://example.com"
    }
  ];
}

