import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/movie_file_card.dart';

class MovieFilePage extends ConsumerWidget {
  const MovieFilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: const Color(0xff192028),
        body: Center(
          child: ListView(shrinkWrap: true, children: const [
            MovieFileCard(),
            MovieFileCard(),
            MovieFileCard(),
          ]),
        ));
  }
}
