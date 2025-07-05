### language_toggle.dart
```dart
// Language toggle (EN / HI)
class LanguageToggle extends StatelessWidget {
  final Function(String) onToggle;
  const LanguageToggle({required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("EN"),
        Switch(
          value: Localizations.localeOf(context).languageCode == 'hi',
          onChanged: (val) => onToggle(val ? 'hi' : 'en'),
        ),
        Text("हिंदी"),
      ],
    );
  }
}
```
