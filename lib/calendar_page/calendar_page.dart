import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/calendar_page/widgets/calendar_widget.dart';

class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      backgroundColor: Color(0xff192028),
      body: SafeArea(child: CalendarWidget()),
    );
  }
}
