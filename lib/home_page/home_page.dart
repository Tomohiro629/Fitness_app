import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import '../login_page/login_page.dart';
import '../sign_up/signup_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                BorderedText(
                  strokeWidth: 2.0,
                  strokeColor: Colors.red,
                  child: const Text(
                    "FITNESS",
                    style: TextStyle(fontSize: 50.0),
                  ),
                ),
                BorderedText(
                  strokeWidth: 2.0,
                  strokeColor: Colors.indigo,
                  child: const Text(
                    "RECORD",
                    style: TextStyle(fontSize: 50.0),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.red,
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: Container(
                      height: 50.0,
                      width: 100.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.05),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: BorderedText(
                        strokeWidth: 2.0,
                        strokeColor: Colors.red,
                        child: const Text(
                          "LOG IN",
                        ),
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.indigo,
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()),
                      );
                    },
                    child: Container(
                      height: 50.0,
                      width: 100.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.05),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: BorderedText(
                        strokeWidth: 2.0,
                        strokeColor: Colors.indigo,
                        child: const Text(
                          "SIGN UP",
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
