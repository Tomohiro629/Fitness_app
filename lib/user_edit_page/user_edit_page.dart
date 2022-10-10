import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karaoke_app/user_edit_page/user_edit_controller.dart';

import '../components/account_button.dart';
import '../components/bordered_text.dart';
import '../components/input_from_filed.dart';
import '../entity/user.dart';

class UserEditPage extends ConsumerWidget {
  const UserEditPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userEditController = ref.watch(userEditControllerProvider(user));
    final weight = TextEditingController();
    final editCalorie = TextEditingController();
    final editProtein = TextEditingController();

    weight.text = user.weight.toString();
    editCalorie.text = user.calorie.toString();
    editProtein.text = user.protein.toString();

    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BorderedTextWidget(
                  label: 'EDIT DATE', storokeColor: Colors.deepOrange),
              const Gap(100),
              InputFromFiled(
                controller: weight,
                icon: Icons.person_outlined,
                hintText: "Edit weight...",
                suffixText: "kg",
                keyboardType: TextInputType.number,
                borderColor: const BorderSide(
                    color: Color.fromARGB(117, 240, 114, 105), width: 3.0),
              ),
              const Gap(50),
              InputFromFiled(
                controller: editCalorie,
                icon: Icons.insights_outlined,
                hintText: "Edit calorie...",
                suffixText: "cal",
                keyboardType: TextInputType.number,
                borderColor: const BorderSide(
                    color: Color.fromARGB(117, 240, 114, 105), width: 3.0),
              ),
              const Gap(50),
              InputFromFiled(
                controller: editProtein,
                icon: Icons.fitness_center_outlined,
                hintText: "Edit protein...",
                suffixText: "g",
                keyboardType: TextInputType.number,
                borderColor: const BorderSide(
                    color: Color.fromARGB(117, 240, 114, 105), width: 3.0),
              ),
              const Gap(50),
              AccountButton(
                  splashColor: const Color.fromARGB(117, 105, 240, 175),
                  onTap: () async {
                    try {
                      userEditController.editUserDate(
                          weight: double.parse(weight.text),
                          calorie: int.parse(editCalorie.text),
                          protein: double.parse(editProtein.text));
                      Navigator.pop(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "入力にエラーがあります。",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  strokeColor: Colors.deepOrange,
                  text: "EDIT")
            ],
          ),
        ),
      ),
    );
  }
}
