import 'package:flutter/material.dart';

class InputFromFiled extends StatelessWidget {
  const InputFromFiled({Key? key, required this.icon, required this.hintText})
      : super(key: key);
  final IconData icon;
  final String hintText;

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
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.white.withOpacity(.7),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 65, 206, 201), width: 3.0),
            ),
            hintMaxLines: 1,
            hintText: hintText,
            hintStyle:
                TextStyle(fontSize: 14, color: Colors.white.withOpacity(.5)),
          ),
        ),
      ),
    );
  }
}
