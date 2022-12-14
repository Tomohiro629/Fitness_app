import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../components/app_colors.dart';
import '../components/bordered_text.dart';
import '../components/custom_button.dart';
import '../components/input_from_filed.dart';
import 'signup_controller.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupController = ref.watch(signupControllerProvider);
    final mailAddress = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BorderedTextWidget(
                  label: "SIGN UP", storokeColor: Colors.red),
              const Gap(150),
              InputFromFiled(
                controller: mailAddress,
                icon: Icons.mail_outline,
                hintText: "Mail address...",
                suffixText: "",
                keyboardType: TextInputType.emailAddress,
                borderColor: const BorderSide(
                    color: Color.fromARGB(117, 206, 65, 65), width: 3.0),
              ),
              const Gap(50),
              InputFromFiled(
                controller: password,
                icon: Icons.lock_outline,
                hintText: "Password...",
                suffixText: "",
                keyboardType: TextInputType.visiblePassword,
                borderColor: const BorderSide(
                    color: Color.fromARGB(117, 206, 65, 65), width: 3.0),
              ),
              const Gap(50),
              CustomButton(
                  splashColor: const Color.fromARGB(117, 206, 65, 65),
                  onTap: () async {
                    try {
                      await signupController.signupUser(
                          newEmail: mailAddress.text,
                          newPassword: password.text);
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    } catch (e) {
                      if (e.toString() ==
                          "[firebase_auth/unknown] Given String is empty or null") {
                        signupController.setErrorText("????????????????????????????????????");
                      } else if (password.text.length < 8) {
                        signupController.setErrorText("??????????????????8?????????????????????");
                        // ignore: unrelated_type_equality_checks
                      } else if (e.toString() ==
                          "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
                        signupController.setErrorText('????????????????????????????????????????????????????????????');
                      } else {
                        signupController.setErrorText("???????????????\n??????????????????????????????");
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            signupController.errorMessage,
                            style: const TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  strokeColor: Colors.red,
                  text: "SIGN UP"),
            ],
          ),
        ),
      ),
    );
  }
}
