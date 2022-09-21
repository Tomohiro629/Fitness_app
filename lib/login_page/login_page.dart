import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:karaoke_app/login_page/login_controller.dart';

import '../components/input_from_filed.dart';

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
              BorderedText(
                strokeWidth: 1.0,
                strokeColor: Colors.indigo,
                child: Text(
                  'Login',
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.indigo,
                      onTap: () async {
                        try {
                          await loginController.loginUser(
                              email: mailAddress.text, password: password.text);
                        } catch (e) {
                          // ignore: avoid_print
                          print(e);
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
                          strokeColor: Colors.indigo,
                          child: const Text(
                            "LOG IN",
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(50),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.indigo,
                      onTap: () async {
                        try {
                          await loginController.handleSignIn();
                        } catch (e) {
                          if (e.toString() ==
                              "[firebase_auth/unknown] Given String is empty or null") {
                            loginController
                                .setErrorText("メールアドレス又はパスワード未入力です。");
                          } else if (e.toString() ==
                              "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
                            loginController.setErrorText("登録のないメールアドレスです。");
                          } else {
                            loginController.setErrorText("ログインエラー\n再度お試しください。");
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
                          strokeColor: Colors.indigo,
                          child: const Text(
                            "Google\nLOG IN",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
