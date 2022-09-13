import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MovieFileCard extends StatelessWidget {
  const MovieFileCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300.0,
                  width: 550.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    color: const Color.fromARGB(255, 50, 23, 147),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50.0,
                        top: 50.0,
                      ),
                      child: Container(
                        height: 200.0,
                        width: 280.0,
                        color: Colors.amber[100],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          BorderedText(
                            strokeWidth: 1.0,
                            strokeColor:
                                const Color.fromARGB(255, 254, 137, 83),
                            child: Text(
                              '曲名',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                wordSpacing: 4,
                              ),
                            ),
                          ),
                          const Gap(20),
                          BorderedText(
                            strokeWidth: 1.0,
                            strokeColor:
                                const Color.fromARGB(255, 254, 137, 83),
                            child: Text(
                              'アーティスト名',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                wordSpacing: 4,
                              ),
                            ),
                          ),
                          const Gap(20),
                          BorderedText(
                            strokeWidth: 1.0,
                            strokeColor:
                                const Color.fromARGB(255, 254, 137, 83),
                            child: Text(
                              '再生時間',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                wordSpacing: 4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
