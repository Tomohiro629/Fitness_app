import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: const Color.fromARGB(117, 65, 206, 201),
        onTap: () {},
        child: Container(
          height: size.width / 8,
          width: size.width / 2,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            "ログイン",
            style: TextStyle(color: Colors.white.withOpacity(.8)),
          ),
        ),
      ),
    );
  }
}
