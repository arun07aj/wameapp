import 'package:flutter/material.dart';
import '../widgets/home_page.dart';
import '../widgets/about_page.dart';

void main() {
  runApp(const WaMeApp());
}

class WaMeApp extends StatelessWidget {
  const WaMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      routes: {
        '/about': (context) => const AboutPage(),
      },
    );
  }
}
