import 'package:flutter/material.dart';

class VariousButton extends StatelessWidget {
  const VariousButton(
      {Key? key,
      required this.onTap,
      required this.icon,
      required this.color,
      required this.text})
      : super(key: key);
  final void Function() onTap;
  final IconData icon;
  final Color color;
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
        Text(text)
      ],
    );
  }
}
