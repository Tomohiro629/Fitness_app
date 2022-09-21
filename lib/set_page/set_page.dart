import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karaoke_app/set_page/set_controller.dart';

import '../components/input_from_filed.dart';

class SetPage extends ConsumerWidget {
  const SetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setController = ref.watch(setControllerProvider);
    final weight = TextEditingController();
    final totalCalorie = TextEditingController();
    final totalProtein = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BorderedText(
                strokeWidth: 1.0,
                strokeColor: Colors.greenAccent,
                child: Text(
                  'SET DATE',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    wordSpacing: 4,
                  ),
                ),
              ),
              const Gap(100),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: const Color.fromARGB(117, 105, 240, 175),
                  onTap: () async {
                    try {
                      if (800 < double.parse(totalCalorie.text)) {
                        await setController.setUserDate(
                            totalCalorie: double.parse(totalCalorie.text),
                            totalProtein: double.parse(totalProtein.text),
                            weight: double.parse(weight.text));
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
                  child: Container(
                    height: 50.0,
                    width: 100.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.05),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: BorderedText(
                      strokeWidth: 1.0,
                      strokeColor: Colors.greenAccent,
                      child: const Text(
                        "SET",
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
