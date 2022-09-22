import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import '../components/account_button.dart';
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
                AccountButton(
                    splashColor: const Color.fromARGB(117, 206, 65, 65),
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()),
                      );
                    },
                    strokeColor: Colors.red,
                    text: "SIGN UP"),
                AccountButton(
                    splashColor: Colors.indigo,
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    strokeColor: Colors.indigo,
                    text: "LOG IN"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
