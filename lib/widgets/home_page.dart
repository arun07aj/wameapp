import 'package:flutter/material.dart';
import '../widgets/whatsapp_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar(
        title: const Text('WhatsApp Chat Creator'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
      body: const WhatsAppForm(),
    );
  }
}