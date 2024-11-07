import 'package:flutter/material.dart';

class Blogcreation extends StatefulWidget {
  final VoidCallback onBack;
  const Blogcreation({super.key, required this.onBack});

  @override
  State<Blogcreation> createState() => _BlogcreationState();
}

class _BlogcreationState extends State<Blogcreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Blog Creation',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
