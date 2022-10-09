import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/record.dart';
import '../entity/user.dart';
import '../record_page/record_page.dart';
import '../repository/record_repository.dart';
import '../set_selected_day_date/set_selected_day_date_page.dart';

class SelectedDayDateGatePage extends ConsumerWidget {
  const SelectedDayDateGatePage(
      {Key? key, required this.user, required this.selectedDay})
      : super(key: key);
  final User user;
  final DateTime selectedDay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDayDate =
        ref.watch(recordRepositoryProvider).fetchRecord(selectedDay);

    return StreamBuilder<Record?>(
        stream: selectedDayDate,
        builder: ((context, snapshot) {
          final isDate = snapshot.data != null;
          return isDate
              ? RecordPage(user: user, selectedDay: selectedDay)
              : SetSelectedDayDatePage(selectedDay: selectedDay);
        }));
  }
}
