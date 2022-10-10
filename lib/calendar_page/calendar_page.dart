import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/user_edit_page/user_edit_page.dart';

import '../components/bordered_text.dart';
import '../entity/user.dart';
import 'widgets/calendar_widget.dart';

class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: SafeArea(
          child: Column(children: [
        Container(
            padding: const EdgeInsets.all(50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BorderedTextWidget(
                    label: "RECORD", storokeColor: Colors.indigo),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => UserEditPage(
                                    user: user,
                                  ))));
                    },
                    icon: const Icon(Icons.settings))
              ],
            )),
        Container(
            padding: const EdgeInsets.only(top: 30.0, bottom: 150.0),
            child: CalendarWidget(user: user)),
      ])),
    );
  }
}
