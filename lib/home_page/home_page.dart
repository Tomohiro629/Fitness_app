import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import '../components/various_button.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                BorderedText(
                  strokeWidth: 2.0,
                  strokeColor: Colors.red,
                  child: const Text(
                    "SONG",
                    style: TextStyle(fontSize: 50.0),
                  ),
                ),
                BorderedText(
                  strokeWidth: 2.0,
                  strokeColor: Colors.indigo,
                  child: const Text(
                    "RECODE",
                    style: TextStyle(fontSize: 50.0),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VariousButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    icon: Icons.play_arrow,
                    color: Colors.blue,
                    text: "ログイン"),
                VariousButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()),
                      );
                    },
                    icon: Icons.stop,
                    color: Colors.red,
                    text: "サインアップ")
              ],
            )
          ],
        ),
      ),
    );
  }
}
