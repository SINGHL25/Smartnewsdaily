
import 'package:flutter/material.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(SmartNewsApp());
}

class SmartNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartNewsDaily',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: SplashPage(),
    );
  }
}
