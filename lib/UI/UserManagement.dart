import 'package:flutter/material.dart';

class Usermanagement extends StatefulWidget {
  final VoidCallback onBack;
  const Usermanagement({super.key, required this.onBack});

  @override
  State<Usermanagement> createState() => _UsermanagementState();
}

class _UsermanagementState extends State<Usermanagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Usermanagement Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
