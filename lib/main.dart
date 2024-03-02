import 'package:flutter/material.dart';
import '../widgets/whatsapp_form.dart';
import '../widgets/about_page.dart';

void main() {
  runApp(const WaMeApp());
}

class WaMeApp extends StatelessWidget {
  const WaMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'WhatsApp Chat Creator',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(secondary: Colors.white),
        primaryColor: Colors.teal,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(fontSize: 18),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            ),
          ),
        ),
      ),
      home: WhatsAppForm(),
    );
  }
}


