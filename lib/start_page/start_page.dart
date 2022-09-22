import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:karaoke_app/start_page/start_controller.dart';

import '../entity/record.dart';

class StartPage extends ConsumerWidget {
  const StartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startController = ref.watch(startControllerProvider);
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: Center(
          child: FirestoreListView<Record>(
        query: startController.recordQuery(),
        itemBuilder: (context, snapshot) {
          final record = snapshot.data();
          return Column(
            children: [
              Text(record.weight.toString()),
              Text(record.calorie.toString()),
              Text(record.protein.toString())
            ],
          );
        },
      )),
    );
  }
}
