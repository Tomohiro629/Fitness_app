import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:karaoke_app/components/bordered_text.dart';
import 'package:karaoke_app/entity/daily_record.dart';
import 'package:karaoke_app/record_page/widgets/sfradial_gauge_widget.dart';
import 'package:karaoke_app/repository/daily_record_repository.dart';
import 'package:karaoke_app/service/auth_service.dart';

import '../components/input_from_filed.dart';
import '../entity/record.dart';
import 'record_controller.dart';

class RecordPage extends ConsumerWidget {
  const RecordPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordController = ref.watch(recordControllerProvider);
    final addCalorie = TextEditingController();
    final addProtein = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: Center(
          child: FirestoreListView<Record>(
        query: recordController.recordQuery(),
        itemBuilder: (context, snapshot) {
          final record = snapshot.data();
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: BorderedTextWidget(
                    label: "${record.weight.toString()} KG",
                    storokeColor: const Color.fromARGB(255, 243, 33, 75)),
              ),
              Column(
                children: [
                  SfRadialGaugeWidget(
                    addValue: double.parse(record.todayCalorie.toString()),
                    label: record.todayCalorie.toString(),
                    total: '${record.calorie}',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InputFromFiled(
                        controller: addCalorie,
                        icon: Icons.insights_outlined,
                        hintText: "Add calorie...",
                        suffixText: "cal",
                        keyboardType: TextInputType.number,
                        borderColor: const BorderSide(
                            color: Colors.yellowAccent, width: 3.0),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: FirestoreListView<DailyRecord>(
                            query: recordController.dailyRecordQuery(
                                record: record),
                            itemBuilder: (context, snapshot) {
                              final dailyRecord = snapshot.data();
                              return IconButton(
                                color: Colors.yellowAccent,
                                onPressed: () {
                                  // ignore: unnecessary_null_comparison
                                  recordController.setDailyRecord(
                                      addCalorie: int.parse(addCalorie.text),
                                      addProtein: dailyRecord.dailyProtein);
                                },
                                icon: const Icon(Icons.add),
                              );
                            }),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SfRadialGaugeWidget(
                    addValue: double.parse(record.todayProtein.toString()),
                    label: record.todayProtein.toString(),
                    total: '${record.protein}',
                  ),
                  Row(
                    children: [
                      InputFromFiled(
                        controller: addProtein,
                        icon: Icons.fitness_center_outlined,
                        hintText: "Add calorie...",
                        suffixText: "g",
                        keyboardType: TextInputType.number,
                        borderColor: const BorderSide(
                            color: Colors.yellowAccent, width: 3.0),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: FirestoreListView<DailyRecord>(
                            query: recordController.dailyRecordQuery(
                                record: record),
                            itemBuilder: (context, snapshot) {
                              final dailyRecord = snapshot.data();
                              return IconButton(
                                color: Colors.yellowAccent,
                                onPressed: () {
                                  // ignore: unnecessary_null_comparison
                                  recordController.setDailyRecord(
                                      addCalorie: dailyRecord.dailyCalorie,
                                      addProtein: int.parse(addProtein.text));
                                },
                                icon: const Icon(Icons.add),
                              );
                            }),
                      )
                    ],
                  ),
                ],
              )
            ],
          );
        },
      )),
    );
  }
}