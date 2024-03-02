import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Text('Ever wondered how to quickly create a Whatsapp chat with a phone number not in your contact list? Just type in the number and we will create it for you. :D'),
      ),
    );
  }
}
