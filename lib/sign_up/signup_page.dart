import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karaoke_app/components/input_from_filed.dart';
import 'package:karaoke_app/sign_up/signup_controller.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupController = ref.watch(signupControllerProvider);
    final userName = TextEditingController();
    final mailAddress = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BorderedText(
                strokeWidth: 1.0,
                strokeColor: Colors.red,
                child: Text(
                  'Signup',
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
                  controller: userName,
                  icon: Icons.person_outlined,
                  hintText: "User name...",
                  keyboardType: TextInputType.name),
              const Gap(50),
              InputFromFiled(
                  controller: mailAddress,
                  icon: Icons.mail_outline,
                  hintText: "Mail address...",
                  keyboardType: TextInputType.emailAddress),
              const Gap(50),
              InputFromFiled(
                  controller: password,
                  icon: Icons.lock_outline,
                  hintText: "Password...",
                  keyboardType: TextInputType.visiblePassword),
              const Gap(50),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: const Color.fromARGB(117, 206, 65, 65),
                  onTap: () async {
                    try {
                      await signupController.signupUser(
                          newEmail: mailAddress.text,
                          newPassword: password.text);
                    } catch (e) {
                      // ignore: avoid_print
                      print(e);
                    }
                  },
                  child: Container(
                    height: 80.0,
                    width: 150.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.05),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "サインアップ",
                      style: TextStyle(color: Colors.white.withOpacity(.8)),
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
