import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: const [
                Text(
                  "Song",
                  style: TextStyle(color: Colors.red, fontSize: 50.0),
                ),
                Text(
                  "Recode",
                  style: TextStyle(color: Colors.indigo, fontSize: 50.0),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: MaterialButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const LoginPage()),
                          // );
                        },
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.indigo,
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: MaterialButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const SignupPage()),
                          // );
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
