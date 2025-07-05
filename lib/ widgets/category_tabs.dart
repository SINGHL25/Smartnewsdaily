## 📆 Additional Components

### category_tabs.dart
```dart
// Widget to show category buttons
class CategoryTabs extends StatelessWidget {
  final List<String> categories;
  final Function(String) onSelected;
  const CategoryTabs({required this.categories, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((cat) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: ElevatedButton(
            onPressed: () => onSelected(cat),
            child: Text(cat),
          ))).toList(),
      ),
    );
  }
}
```
