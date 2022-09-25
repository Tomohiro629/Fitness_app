import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:karaoke_app/calendar_page/calendar_widget.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff192028),
        body: Column(
          children: const <Widget>[Gap(50.0), CalendarWidget()],
        ));
  }
}
