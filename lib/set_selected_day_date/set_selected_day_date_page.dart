import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:gap/gap.dart';

import '../components/account_button.dart';
import '../entity/user.dart';
import '../record_page/record_controller.dart';
import '../repository/user_repository.dart';
import '../service/auth_service.dart';
import '../service/common_method.dart';

class SetSelectedDayDatePage extends ConsumerWidget {
  const SetSelectedDayDatePage({super.key, required this.selectedDay});
  final DateTime selectedDay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(authServiceProvider).userId;
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: SafeArea(
          child: Center(
        child: FirestoreListView<User>(
          query: ref.watch(userRepositoryProvider).queryUser(userId),
          itemBuilder: ((context, snapshot) {
            final user = snapshot.data();
            return Column(children: [
              const Gap(400),
              getDateString(selectedDay) == getDateString(DateTime.now())
                  ? AccountButton(
                      splashColor: Colors.orange,
                      onTap: () {
                        if (getDateString(selectedDay) ==
                            getDateString(DateTime.now())) {
                          ref.watch(recordControllerProvider).setDailyRecord(
                              totalCalorie: 0,
                              setCalorie: user.calorie,
                              totalProtein: 0.0,
                              setProtein: user.protein);
                        }
                      },
                      strokeColor: Colors.orange,
                      text: "RECORD START")
                  : Center(
                      child: DateTime.now().isBefore(selectedDay)
                          ? const Text("Please wait...")
                          : const Text("No Data..."))
            ]);
          }),
        ),
      )),
    );
  }
}
