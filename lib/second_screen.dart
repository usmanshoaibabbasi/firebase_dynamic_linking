import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final String passData;
  const SecondScreen({
    Key? key,
    required this.passData,
  }) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        widget.passData,
        style: const TextStyle(
          fontSize: 24,
        ),
      )),
    );
  }
}
