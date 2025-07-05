### firebase_service.dart
```dart
// Firebase Firestore logic
class FirebaseService {
  final _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getNewsByCategory(String category) async {
    final result = await _firestore
        .collection('news_articles')
        .where('category', isEqualTo: category)
        .get();
    return result.docs.map((d) => d.data()).toList();
  }
}
```
