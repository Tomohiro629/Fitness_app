import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:karaoke_app/entity/record.dart';
import 'package:karaoke_app/components/sfradial_gauge_widget.dart';

import '../components/input_from_filed.dart';
import '../service/common_method.dart';
import 'record_controller.dart';

class RecordPage extends ConsumerWidget {
  const RecordPage({
    Key? key,
  }) : super(key: key);

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
                          addProtein.clear();
                        },
                        icon: const Icon(Icons.add),
                      )
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      )),
    );
  }
}
