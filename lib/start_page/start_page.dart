import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/components/various_button.dart';

class StartPage extends ConsumerWidget {
  const StartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController(viewportFraction: 0.85);
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: Center(
          child: Column(
        children: [
          Container(
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
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Color.fromARGB(255, 34, 171, 234), width: 5),
                  ),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Color.fromARGB(255, 34, 171, 234), width: 5),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 350,
              color: const Color.fromARGB(255, 3, 42, 52),
              child: GridView.count(
                crossAxisCount: 2,
                children: const [
                  Card(
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        "録音ファイル",
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        "動画ファイル",
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        "ランキング",
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        "ランダムに\n曲を選択",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VariousButton(
                    onTap: () {},
                    icon: Icons.play_arrow,
                    color: Colors.blue,
                    textColor: Colors.blue,
                    text: "撮影開始"),
                VariousButton(
                    onTap: () {},
                    icon: Icons.play_arrow,
                    color: Colors.red,
                    textColor: Colors.red,
                    text: "録音開始")
              ],
            ),
          )
        ],
      )),
    );
  }
}
