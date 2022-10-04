import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/account_button.dart';
import '../entity/user.dart';
import 'widgets/calendar_widget.dart';
import 'widgets/calorie_setting_dialog.dart';
import 'widgets/protein_setting_dialog.dart';

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
            padding: const EdgeInsets.only(top: 30.0),
            child: const CalendarWidget()),
        Container(
            padding: const EdgeInsets.all(30),
            child: Text(
              "現体重${user.weight.toString()}kg",
              style: const TextStyle(fontSize: 25.0),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AccountButton(
                splashColor: Colors.greenAccent,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CalorieSettingDialog(
                          user: user,
                        );
                      });
                },
                strokeColor: Colors.greenAccent,
                text: "カロリー変更"),
            AccountButton(
                splashColor: Colors.yellowAccent,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ProteinSettingDialog(
                          user: user,
                        );
                      });
                },
                strokeColor: Colors.yellowAccent,
                text: "タンパク量変更"),
          ],
        )
      ])),
    );
  }
}
