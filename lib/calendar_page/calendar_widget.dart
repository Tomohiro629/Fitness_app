import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends ConsumerWidget {
  const CalendarWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2022, 9, 1),
      lastDay: DateTime.utc(2100, 1, 1),
      locale: 'ja_jp',
    );
  }
}
