import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

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
                    "SONG",
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
          ],
        ),
      ),
    );
  }
}
