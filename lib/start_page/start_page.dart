import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/components/various_button.dart';

import '../movie-file_page/movie_file_page.dart';

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
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MovieFilePage()),
                      );
                    },
                    child: const Card(
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          "動画ファイル",
                        ),
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
                    onTap: () {
                      // if (movieData != null) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const SetMovieDataPage()),
                      //   );
                      // } else {
                      //   Navigator.pop(context);
                      // }
                    },
                    icon: Icons.play_arrow,
                    color: Colors.blue,
                    textColor: Colors.blue,
                    text: "撮影開始"),
                VariousButton(
                    onTap: () {
                      // if (recordingData != null) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const SetRecordingDataPage()),
                      //   );
                      // } else {
                      //   Navigator.pop(context);
                      // }
                    },
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
