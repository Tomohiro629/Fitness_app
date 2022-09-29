import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:karaoke_app/calendar_page/widgets/calendar_widget.dart';
import 'package:karaoke_app/record_page/record_controller.dart';
import 'package:karaoke_app/components/sfradial_gauge_widget.dart';

import '../entity/record.dart';

class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(recordControllerProvider);
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: SafeArea(
        child: Column(
          children: [
            const CalendarWidget(),
            SizedBox(
              height: 250.0,
              width: double.infinity,
              child: FirestoreListView<Record>(
                  query: controller.recordQuery(),
                  itemBuilder: (context, snapshot) {
                    final record = snapshot.data();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SfRadialGaugeWidget(
                          radiusSize: 0.5,
                          addValue:
                              double.parse(record.totalCalorie.toString()),
                          label: "test",
                          total: '1800',
                        ),
                        SfRadialGaugeWidget(
                          radiusSize: 0.5,
                          addValue:
                              double.parse(record.totalProtein.toString()),
                          label: "test",
                          total: "100",
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
