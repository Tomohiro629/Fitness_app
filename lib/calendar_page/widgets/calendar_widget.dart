import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/selected_day_date_gate/selected_day_date_gate.dart';
import 'package:table_calendar/table_calendar.dart';

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
      firstDay: DateTime.utc(2022, 9, 1),
      lastDay: DateTime.utc(2100, 1, 1),
      locale: 'ja_jp',
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
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
      ),
      calendarFormat: calendarModel.format,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
        CalendarFormat.week: 'Week',
      },
      startingDayOfWeek: StartingDayOfWeek.sunday,
      calendarStyle: const CalendarStyle(
        todayTextStyle: TextStyle(color: Colors.yellow),
        todayDecoration: BoxDecoration(
          color: Color.fromARGB(149, 6, 27, 186),
          shape: BoxShape.circle,
        ),
        weekendTextStyle: TextStyle(color: Color.fromARGB(255, 255, 22, 22)),
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
