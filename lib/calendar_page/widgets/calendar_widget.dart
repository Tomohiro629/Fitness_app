import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../selected_day_date_gate/selected_day_date_gate.dart';
import '../calendar_controller.dart';

class CalendarWidget extends ConsumerWidget {
  const CalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarModel = ref.watch(calendarControllerProvider);

    return TableCalendar(
      focusedDay: calendarModel.focusDay,
      firstDay: DateTime.utc(2022, 10, 1),
      lastDay: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          //当月の日付
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.all(15.0),
            child: Text(
              day.day.toString(),
              style: TextStyle(
                color: ref
                    .read(calendarControllerProvider.notifier)
                    .textColor(day),
              ),
            ),
          );
        },
        dowBuilder: (context, day) {
          //日付部分
          return Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              DateFormat.E().format(day),
              style: TextStyle(
                color: ref
                    .read(calendarControllerProvider.notifier)
                    .textColor(day),
              ),
            ),
          );
        },
        disabledBuilder: (context, day, focusedDay) {
          //当月外の日付
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              day.day.toString(),
              style: const TextStyle(color: Color.fromARGB(255, 67, 66, 66)),
            ),
          );
        },
      ),
      calendarFormat: calendarModel.format,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
        CalendarFormat.week: 'Week',
      },
      startingDayOfWeek: StartingDayOfWeek.sunday,
      calendarStyle: const CalendarStyle(
        todayTextStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        todayDecoration: BoxDecoration(
          color: Color.fromARGB(146, 51, 228, 169),
          shape: BoxShape.circle,
        ),
      ),
      onFormatChanged: (format) {
        ref.read(calendarControllerProvider.notifier).changeFormat(format);
      },
      onDaySelected: (selectedDay, _) async {
        ref.read(calendarControllerProvider.notifier).changeDay(selectedDay);

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (
            context,
          ) =>
                  SelectedDayDateGatePage(
                    selectedDay: selectedDay,
                  )),
        );
      },
    );
  }
}
