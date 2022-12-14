import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../components/custom_button.dart';
import '../components/bordered_text.dart';
import '../components/input_from_filed.dart';
import 'login_controller.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.watch(loginControllerProvider);
    final TextEditingController mailAddress = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BorderedTextWidget(
                storokeColor: Colors.indigo,
                label: 'LOGIN',
              ),
              const Gap(100),
              InputFromFiled(
                controller: mailAddress,
                icon: Icons.mail_outline,
                hintText: "Mail address...",
                suffixText: "",
                keyboardType: TextInputType.emailAddress,
                borderColor: const BorderSide(color: Colors.indigo, width: 3.0),
              ),
              const Gap(50),
              InputFromFiled(
                controller: password,
                icon: Icons.lock_outline,
                hintText: "Password...",
                suffixText: "",
                keyboardType: TextInputType.visiblePassword,
                borderColor: const BorderSide(color: Colors.indigo, width: 3.0),
              ),
              const Gap(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      splashColor: Colors.indigo,
                      onTap: () async {
                        try {
                          await loginController.loginUser(
                              email: mailAddress.text, password: password.text);
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        } catch (e) {
                          if (e.toString() ==
                              "[firebase_auth/unknown] Given String is empty or null") {
                            loginController
                                .setErrorText("????????????????????????????????????????????????????????????");
                          } else if (e.toString() ==
                              "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
                            loginController.setErrorText("?????????????????????????????????????????????");
                          } else {
                            loginController.setErrorText("?????????????????????\n??????????????????????????????");
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                loginController.errorMessage,
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      strokeColor: Colors.indigo,
                      text: "LOG IN"),

                  // CustomButton(
                  //     splashColor: Colors.indigo,
                  //     onTap: () async {
                  //       try {
                  //         await loginController.handleSignIn();
                  //       } catch (e) {
                  //         if (e.toString() ==
                  //             "[firebase_auth/unknown] Given String is empty or null") {
                  //           loginController
                  //               .setErrorText("????????????????????????????????????????????????????????????");
                  //         } else if (e.toString() ==
                  //             "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
                  //           loginController.setErrorText("?????????????????????????????????????????????");
                  //         } else {
                  //           loginController.setErrorText("?????????????????????\n??????????????????????????????");
                  //         }
                  //         ScaffoldMessenger.of(context).showSnackBar(
                  //           SnackBar(
                  //             content: Text(
                  //               loginController.errorMessage,
                  //               textAlign: TextAlign.center,
                  //             ),
                  //             backgroundColor: Colors.red,
                  //             duration: const Duration(seconds: 2),
                  //           ),
                  //         );
                  //       }
                  //     },
                  //     strokeColor: Colors.indigo,
                  //     text: "Google\nLOG IN")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
