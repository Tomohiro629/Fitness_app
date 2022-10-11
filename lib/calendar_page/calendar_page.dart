import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
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
          child: SingleChildScrollView(
        child: Column(children: [
          Container(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(20),
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
                      icon: const Icon(
                        Icons.settings,
                      ))
                ],
              )),
          CalendarWidget(user: user),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 350.0,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 300.0,
                        width: 500.0,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 300.0,
                        width: 500.0,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 300.0,
                        width: 500.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_a_photo_outlined,
                      color: Color.fromARGB(255, 184, 13, 1),
                    )),
              ),
            ],
          )
        ]),
      )),
    );
  }
}
