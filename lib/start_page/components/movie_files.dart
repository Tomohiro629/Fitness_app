import 'package:flutter/material.dart';

import '../../movie-file_page/movie_file_page.dart';

class MovieFiles extends StatelessWidget {
  const MovieFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
