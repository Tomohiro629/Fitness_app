import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:karaoke_app/record_page/widgets/sfradial_gauge_widget.dart';

import '../entity/record.dart';
import 'record_controller.dart';

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
              SfRadialGaugeWidget(
                addValue: 90.0,
                label: "add cal",
                total: '${record.calorie}cal',
              ),
              SfRadialGaugeWidget(
                addValue: 50.0,
                label: 'add protein',
                total: '${record.protein}g',
              )
            ],
          );
        },
      )),
    );
  }
}
