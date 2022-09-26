import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class BorderedTextWidget extends StatelessWidget {
  const BorderedTextWidget({
    Key? key,
    required this.label,
    required this.storokeColor,
  }) : super(key: key);
  final Color storokeColor;
  final String label;
  @override
  Widget build(BuildContext context) {
    return BorderedText(
      strokeWidth: 1.0,
      strokeColor: storokeColor,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontSize: 30,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
          wordSpacing: 4,
        ),
      ),
    );
  }
}
