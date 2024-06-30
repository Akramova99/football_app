import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "working on it",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}