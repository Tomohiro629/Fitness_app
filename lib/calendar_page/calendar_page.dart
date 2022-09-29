import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:karaoke_app/calendar_page/widgets/calendar_widget.dart';
import 'package:karaoke_app/entity/record.dart';
import 'package:karaoke_app/repository/record_repository.dart';

class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordController = ref.watch(recordRepositoryProvider);
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: SafeArea(
        child: FirestoreListView<Record>(
          query: recordController.queryRecord(),
          itemBuilder: (context, snapshot) {
            final record = snapshot.data();
            return Column(
              children: [
                CalendarWidget(
                  record: record,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
