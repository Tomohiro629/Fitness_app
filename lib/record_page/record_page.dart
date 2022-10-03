import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:karaoke_app/components/account_button.dart';
import 'package:karaoke_app/components/bordered_text.dart';
import 'package:karaoke_app/entity/record.dart';
import 'package:karaoke_app/components/sfradial_gauge_widget.dart';
import 'package:karaoke_app/service/common_method.dart';

import '../components/input_from_filed.dart';
import 'record_controller.dart';

class RecordPage extends ConsumerWidget {
  const RecordPage({
    Key? key,
    required this.selectedDay,
  }) : super(key: key);

  final DateTime selectedDay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordController = ref.watch(recordControllerProvider);
    final addCalorie = TextEditingController();
    final addProtein = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: SafeArea(
        child: Center(
            child: getDateString(selectedDay) == getDateString(DateTime.now())
                ? FirestoreListView<Record>(
                    query: recordController.recordQuery(selectedDay),
                    itemBuilder: (context, snapshot) {
                      final record = snapshot.data();
                      return Column(
                        children: [
                          Text(getDateString(selectedDay)),
                          SfRadialGaugeWidget(
                            radiusSize: 0.8,
                            addValue:
                                double.parse(record.totalCalorie.toString()),
                            label: record.totalCalorie.toString(),
                            total: '${record.setCalorie}',
                          ),
                          getDateString(selectedDay) ==
                                  getDateString(DateTime.now())
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InputFromFiled(
                                      controller: addCalorie,
                                      icon: Icons.insights_outlined,
                                      hintText: "Add calorie...",
                                      suffixText: "cal",
                                      keyboardType: TextInputType.number,
                                      borderColor: const BorderSide(
                                          color: Colors.yellowAccent,
                                          width: 3.0),
                                    ),
                                    IconButton(
                                      color: Colors.yellowAccent,
                                      onPressed: () {
                                        recordController.addRecord(
                                            record: record,
                                            addCalorie: record.totalCalorie +
                                                int.parse(addCalorie.text),
                                            addProtein: record.totalProtein);
                                        addCalorie.clear();
                                      },
                                      icon: const Icon(Icons.add),
                                    ),
                                  ],
                                )
                              : BorderedTextWidget(
                                  label: 'Total ${record.totalCalorie} cal ',
                                  storokeColor:
                                      record.setCalorie > record.totalCalorie
                                          ? Colors.blue
                                          : Colors.red,
                                ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SfRadialGaugeWidget(
                                radiusSize: 0.8,
                                addValue: double.parse(
                                    record.totalProtein.toString()),
                                label: record.totalProtein.toString(),
                                total: '${record.setProtein}',
                              ),
                              // ignore: unrelated_type_equality_checks
                              getDateString(selectedDay) ==
                                      getDateString(DateTime.now())
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InputFromFiled(
                                          controller: addProtein,
                                          icon: Icons.fitness_center_outlined,
                                          hintText: "Add protein...",
                                          suffixText: "g",
                                          keyboardType: TextInputType.number,
                                          borderColor: const BorderSide(
                                              color: Colors.yellowAccent,
                                              width: 3.0),
                                        ),
                                        IconButton(
                                          color: Colors.yellowAccent,
                                          onPressed: () {
                                            recordController.addRecord(
                                                record: record,
                                                addProtein: record
                                                        .totalProtein +
                                                    int.parse(addProtein.text),
                                                addCalorie:
                                                    record.totalCalorie);
                                            addProtein.clear();
                                          },
                                          icon: const Icon(Icons.add),
                                        )
                                      ],
                                    )
                                  : BorderedTextWidget(
                                      label: 'Total ${record.totalProtein} g',
                                      storokeColor: record.setProtein >
                                              record.totalProtein
                                          ? Colors.blue
                                          : Colors.red,
                                    ),
                            ],
                          ),
                        ],
                      );
                    },
                  )
                : const BorderedTextWidget(
                    label: 'まだ記録できません。', storokeColor: Colors.orange)),
      ),
    );
  }
}
