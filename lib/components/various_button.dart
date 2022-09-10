import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class VariousButton extends StatelessWidget {
  const VariousButton(
      {Key? key,
      required this.onTap,
      required this.icon,
      required this.color,
      required this.textColor,
      required this.text})
      : super(key: key);
  final void Function() onTap;
  final IconData icon;
  final Color color;
  final Color textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(50)),
          child: MaterialButton(
            onPressed: onTap,
            child: Icon(
              icon,
              color: color,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: BorderedText(
            strokeWidth: 1.0,
            strokeColor: textColor,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
