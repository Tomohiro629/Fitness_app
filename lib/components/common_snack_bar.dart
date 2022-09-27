import 'package:flutter/material.dart';

class CommonSnackBar extends StatelessWidget {
  const CommonSnackBar({super.key, required this.message, required this.color});
  final String message;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 1),
    );
  }
}
