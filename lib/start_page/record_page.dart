import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:karaoke_app/start_page/record_controller.dart';

import '../entity/record.dart';

class RecordPage extends ConsumerWidget {
  const RecordPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordController = ref.watch(recordControllerProvider);
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: Center(
          child: FirestoreListView<Record>(
        query: recordController.recordQuery(),
        itemBuilder: (context, snapshot) {
          final record = snapshot.data();
          return Column(
            children: [
              Card(
                color: Colors.blueAccent,
                child: Text(
                  "${record.weight}kg",
                  style: const TextStyle(fontSize: 25.0),
                ),
              ),
              Card(
                color: Colors.blueAccent,
                child: Text(
                  "${record.calorie.toString()}cal",
                  style: const TextStyle(fontSize: 25.0),
                ),
              ),
              Card(
                color: Colors.blueAccent,
                child: Text(
                  "${record.protein.toString()}g",
                  style: const TextStyle(fontSize: 25.0),
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
