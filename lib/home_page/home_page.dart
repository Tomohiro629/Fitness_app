import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:karaoke_app/login_page/login_page.dart';
import 'package:karaoke_app/sign_up/signup_page.dart';

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
                Column(
                  children: [
                    Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.05),
                          borderRadius: BorderRadius.circular(50)),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const Text("ログイン")
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.05),
                          borderRadius: BorderRadius.circular(50)),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupPage()),
                          );
                        },
                        child: const Icon(
                          Icons.stop,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const Text("サインアップ")
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
