import 'package:flutter/material.dart';

class HelloWorldScreen extends StatelessWidget {
  const HelloWorldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello worldasdasdasdsad',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
