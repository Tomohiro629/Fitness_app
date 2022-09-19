import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/components/various_button.dart';
import 'package:karaoke_app/start_page/components/movie_files.dart';
import 'package:karaoke_app/start_page/components/score_cards.dart';

class StartPage extends ConsumerWidget {
  const StartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: Center(
          child: Column(
        children: [
          const ScoreCards(),
          const MovieFiles(),
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
