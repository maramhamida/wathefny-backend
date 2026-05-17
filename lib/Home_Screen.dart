import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), backgroundColor: Color(0xFF73946B)),
      body: Center(
        child: Text(
          'Welcome to Home Screen!',
          style: TextStyle(fontSize: 20, fontFamily: 'Adamina'),
        ),
      ),
    );
  }
}
