import 'package:flutter/material.dart';

class InputFromFiled extends StatelessWidget {
  const InputFromFiled(
      {Key? key,
      required this.controller,
      required this.icon,
      required this.hintText,
      required this.suffixText,
      required this.keyboardType,
      required this.borderColor})
      : super(key: key);
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final String suffixText;
  final TextInputType keyboardType;
  final BorderSide borderColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: size.width / 8,
        width: size.width / 1.2,
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: size.width / 30),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.05),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          style: TextStyle(color: Colors.white.withOpacity(.8)),
          cursorColor: Colors.white,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Text(suffixText),
            ),
            prefixIcon: Icon(
              icon,
              color: Colors.white.withOpacity(.7),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: borderColor,
            ),
            hintMaxLines: 1,
            labelText: hintText,
            hintStyle:
                TextStyle(fontSize: 14, color: Colors.white.withOpacity(.5)),
          ),
          controller: controller,
        ),
      ),
    );
  }
}
