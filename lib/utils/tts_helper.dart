### tts_helper.dart
```dart
// Text-to-speech wrapper
class TTSHelper {
  final FlutterTts _tts = FlutterTts();

  Future<void> speak(String text) async {
    await _tts.setLanguage("en-US");
    await _tts.setPitch(1.0);
    await _tts.speak(text);
  }
}
```
