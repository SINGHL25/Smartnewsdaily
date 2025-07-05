### theme_provider.dart
```dart
// Theme toggle
class ThemeProvider with ChangeNotifier {
  bool isDark = false;

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
```
