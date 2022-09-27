import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:karaoke_app/entity/daily_record.dart';
import 'package:karaoke_app/record_page/widgets/sfradial_gauge_widget.dart';

import '../components/input_from_filed.dart';
import '../entity/record.dart';
import '../service/common_method.dart';
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
            children: [
              Text(getDateString(DateTime.now())),
              Stack(
                children: <Widget>[
                  record.todayCalorie < record.calorie
                      ? const Text("")
                      : Align(
                          alignment: Alignment.center,
                          child: Text(
                            "OVER + ${record.todayCalorie - record.calorie}",
                            style: const TextStyle(
                                color: Colors.red, fontSize: 25.0),
                          ),
                        ),
                  SfRadialGaugeWidget(
                    addValue: double.parse(record.todayCalorie.toString()),
                    label: record.todayCalorie.toString(),
                    total: '${record.calorie}',
                  ),
                ],
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
                        query:
                            recordController.dailyRecordQuery(record: record),
                        itemBuilder: (context, snapshot) {
                          final dailyRecord = snapshot.data();
                          return IconButton(
                            color: Colors.yellowAccent,
                            onPressed: () {
                              if (addCalorie.text.isNotEmpty) {
                                recordController.setAddCalorie(
                                    record: record,
                                    addCalorie: (record.todayCalorie +
                                        int.parse(addCalorie.text)));
                                recordController.setDailyRecord(
                                    dayTotalCalorie: (record.todayCalorie +
                                        int.parse(addCalorie.text)),
                                    dayTotalProtein:
                                        dailyRecord.dayTotalProtein);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "数字を入力してください。",
                                      textAlign: TextAlign.center,
                                    ),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              }
                              addCalorie.clear();
                            },
                            icon: const Icon(Icons.add),
                          );
                        }),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      record.todayProtein < record.protein
                          ? const Text("")
                          : Align(
                              alignment: Alignment.center,
                              child: Text(
                                "OVER + ${record.todayProtein - record.protein}",
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 25.0),
                              ),
                            ),
                      SfRadialGaugeWidget(
                        addValue: double.parse(record.todayProtein.toString()),
                        label: record.todayProtein.toString(),
                        total: '${record.protein}',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InputFromFiled(
                        controller: addProtein,
                        icon: Icons.fitness_center_outlined,
                        hintText: "Add protein...",
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
                                  if (addProtein.text.isNotEmpty) {
                                    recordController.setAddProtein(
                                        record: record,
                                        addProtein: record.todayProtein +
                                            int.parse(addProtein.text));
                                    recordController.setDailyRecord(
                                        dayTotalCalorie:
                                            dailyRecord.dayTotalCalorie,
                                        dayTotalProtein: record.todayProtein +
                                            int.parse(addProtein.text));
                                    addProtein.clear();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "数字を入力してください。",
                                          textAlign: TextAlign.center,
                                        ),
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  }
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
