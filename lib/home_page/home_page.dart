import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../components/bordered_text.dart';
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
              children: const [
                BorderedTextWidget(label: "FITNESS", storokeColor: Colors.red),
                BorderedTextWidget(label: "RECORD", storokeColor: Colors.indigo)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomButton(
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
                CustomButton(
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
