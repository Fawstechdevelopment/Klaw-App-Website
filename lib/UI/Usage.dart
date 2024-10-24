import 'package:flutter/material.dart';

class Usage extends StatefulWidget {
  const Usage({super.key});

  @override
  State<Usage> createState() => _UsageState();
}

class _UsageState extends State<Usage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Text(
        'Usage Page',
        style: TextStyle(fontSize: 24),
      ),
    ), );
  }
}
