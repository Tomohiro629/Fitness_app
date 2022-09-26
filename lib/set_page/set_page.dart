import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karaoke_app/components/account_button.dart';
import 'package:karaoke_app/components/bordered_text.dart';
import 'package:karaoke_app/set_page/set_controller.dart';

import '../components/input_from_filed.dart';

class SetPage extends ConsumerWidget {
  const SetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setController = ref.watch(setControllerProvider);
    final userName = TextEditingController();
    final weight = TextEditingController();
    final totalCalorie = TextEditingController();
    final totalProtein = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BorderedTextWidget(
                  label: 'SET DATE', storokeColor: Colors.greenAccent),
              const Gap(100),
              InputFromFiled(
                controller: userName,
                icon: Icons.person_outlined,
                hintText: "User name...",
                suffixText: "",
                keyboardType: TextInputType.name,
                borderColor: const BorderSide(
                    color: Color.fromARGB(117, 105, 240, 175), width: 3.0),
              ),
              const Gap(50),
              InputFromFiled(
                controller: weight,
                icon: Icons.person_outlined,
                hintText: "User weight...",
                suffixText: "kg",
                keyboardType: TextInputType.number,
                borderColor: const BorderSide(
                    color: Color.fromARGB(117, 105, 240, 175), width: 3.0),
              ),
              const Gap(50),
              InputFromFiled(
                controller: totalCalorie,
                icon: Icons.insights_outlined,
                hintText: "Total calorie...",
                suffixText: "cal",
                keyboardType: TextInputType.number,
                borderColor: const BorderSide(
                    color: Color.fromARGB(117, 105, 240, 175), width: 3.0),
              ),
              const Gap(50),
              InputFromFiled(
                controller: totalProtein,
                icon: Icons.fitness_center_outlined,
                hintText: "Total protein...",
                suffixText: "g",
                keyboardType: TextInputType.number,
                borderColor: const BorderSide(
                    color: Color.fromARGB(117, 105, 240, 175), width: 3.0),
              ),
              const Gap(50),
              AccountButton(
                  splashColor: const Color.fromARGB(117, 105, 240, 175),
                  onTap: () async {
                    try {
                      if (800 < double.parse(totalCalorie.text)) {
                        await setController.setUserDate(
                            totalCalorie: double.parse(totalCalorie.text),
                            totalProtein: double.parse(totalProtein.text),
                            weight: double.parse(weight.text),
                            userName: userName.text);
                      }
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
                  strokeColor: Colors.greenAccent,
                  text: "SET")
            ],
          ),
        ),
      ),
    );
  }
}
