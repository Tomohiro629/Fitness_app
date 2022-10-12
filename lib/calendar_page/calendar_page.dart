import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../components/app_colors.dart';
import '../components/bordered_text.dart';
import '../entity/user.dart';
import '../images_list/images_list_widget.dart';
import '../user_edit_page/user_edit_page.dart';
import 'widgets/calendar_widget.dart';

class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
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
          const ImagesListWidget(),
        ]),
      )),
    );
  }
}
