import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton(
      {Key? key,
      required this.splashColor,
      required this.onTap,
      required this.strokeColor,
      required this.text})
      : super(key: key);

  final Color splashColor;
  final Function() onTap;
  final Color strokeColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: splashColor,
        onTap: onTap,
        child: Container(
          height: 50.0,
          width: 100.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: BorderedText(
            strokeWidth: 1.0,
            strokeColor: strokeColor,
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
