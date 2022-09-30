import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:karaoke_app/entity/record.dart';
import 'package:karaoke_app/components/sfradial_gauge_widget.dart';
import 'package:karaoke_app/service/common_method.dart';

import '../components/input_from_filed.dart';
import 'record_controller.dart';

class RecordPage extends ConsumerWidget {
  const RecordPage({Key? key, required this.record, required this.selectedDay})
      : super(key: key);
  final Record record;
  final DateTime selectedDay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordController = ref.watch(recordControllerProvider(record));
    final addCalorie = TextEditingController();
    final addProtein = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text(getDateString(selectedDay)),
                SfRadialGaugeWidget(
                  radiusSize: 0.8,
                  addValue: double.parse(record.totalCalorie.toString()),
                  label: record.totalCalorie.toString(),
                  total: '${record.setCalorie}',
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
                    IconButton(
                      color: Colors.yellowAccent,
                      onPressed: () {
                        recordController.addCalorie(
                            addCalorie: record.totalCalorie +
                                int.parse(addCalorie.text));
                        addCalorie.clear();
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SfRadialGaugeWidget(
                      radiusSize: 0.8,
                      addValue: double.parse(record.totalProtein.toString()),
                      label: record.totalProtein.toString(),
                      total: '${record.setProtein}',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        IconButton(
                          color: Colors.yellowAccent,
                          onPressed: () {
                            recordController.addProtein(
                                totalProtein: record.totalProtein +
                                    int.parse(addProtein.text));
                            addProtein.clear();
                          },
                          icon: const Icon(Icons.add),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
