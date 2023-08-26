import 'package:flutter/material.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(message,
            style: const TextStyle(fontSize: 18.0, color: Colors.red)));
  }
}
