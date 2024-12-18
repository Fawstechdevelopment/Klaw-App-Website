import 'package:flutter/material.dart';

class Blogcreation extends StatefulWidget {
  const Blogcreation({super.key, });

  @override
  State<Blogcreation> createState() => _BlogcreationState();
}

class _BlogcreationState extends State<Blogcreation> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Blog Creation',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
