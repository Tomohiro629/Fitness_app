import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/account_button.dart';
import '../../entity/user.dart';
import 'setting_dialog_controller.dart';

class CalorieSettingDialog extends ConsumerWidget {
  const CalorieSettingDialog({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingController = ref.watch(settingControllerProvider);
    Size size = MediaQuery.of(context).size;
    final fixCalorie = TextEditingController();

    return AlertDialog(
      backgroundColor: const Color(0xff192028),
      content: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Row(
          children: [
            Container(
              height: size.width / 5,
              width: size.width / 2.5,
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: size.width / 30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.05),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                style: TextStyle(color: Colors.white.withOpacity(.8)),
                cursorColor: Colors.white,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffixIcon: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("cal"),
                  ),
                  prefixIcon: Icon(
                    Icons.insights_outlined,
                    color: Colors.white.withOpacity(.7),
                  ),
                  hintMaxLines: 1,
                  hintStyle: TextStyle(
                      fontSize: 14, color: Colors.white.withOpacity(.5)),
                ),
                controller: fixCalorie,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBox(
                height: size.width / 5,
                child: AccountButton(
                    splashColor: Colors.green,
                    onTap: () {
                      if (fixCalorie.text.isNotEmpty) {
                        settingController.fixCalorie(
                            user: user, setCalorie: int.parse(fixCalorie.text));
                      }
                      Navigator.pop(context);
                    },
                    strokeColor: Colors.green,
                    text: "Fix"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
