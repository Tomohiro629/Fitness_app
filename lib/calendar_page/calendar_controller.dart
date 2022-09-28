import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarModel {
  final CalendarFormat format;
  final DateTime focusDay;

  factory CalendarModel.init() {
    return CalendarModel(
      CalendarFormat.week,
      DateTime.now(),
    );
  }

  CalendarModel copyWith({
    CalendarFormat? format,
    DateTime? focusDay,
  }) {
    return CalendarModel(
      format ?? this.format,
      focusDay ?? this.focusDay,
    );
  }

  CalendarModel(
    this.format,
    this.focusDay,
  );
}

final calendarControllerProvider =
    StateNotifierProvider<CalendarController, CalendarModel>((ref) {
  return CalendarController();
});

class CalendarController extends StateNotifier<CalendarModel> {
  CalendarController() : super(CalendarModel.init());

  void changeDay(DateTime selectedDay) {
    state = state.copyWith(focusDay: selectedDay);
  }

  void changeFormat(CalendarFormat format) {
    state = state.copyWith(format: format);
  }
}
