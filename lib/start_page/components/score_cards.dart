import 'package:flutter/material.dart';

class ScoreCards extends StatelessWidget {
  const ScoreCards({super.key});
  @override
  Widget build(BuildContext context) {
    final pageController = PageController(viewportFraction: 0.85);
    return Container(
      margin: const EdgeInsets.only(top: 50.0, bottom: 20.0),
      height: 250.0,
      child: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: const [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Color.fromARGB(255, 34, 171, 234), width: 5),
            ),
          ),
        ],
      ),
    );
  }
}
