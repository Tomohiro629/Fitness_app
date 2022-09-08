import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/sign_up/components/signup_input_from_filed.dart';
import 'package:karaoke_app/sign_up/components/signup_button.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height * .2),
                      child: BorderedText(
                        strokeWidth: 1.0,
                        strokeColor: const Color.fromARGB(255, 65, 206, 201),
                        child: const Text(
                          'Signup',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            wordSpacing: 4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SignupInputFromFiled(
                          icon: Icons.account_circle_outlined,
                          hintText: 'User name...',
                        ),
                        const SignupInputFromFiled(
                          icon: Icons.email_outlined,
                          hintText: 'Mail address...',
                        ),
                        const SignupInputFromFiled(
                          icon: Icons.lock_outline,
                          hintText: 'Password...',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SignupButton(),
                            SizedBox(width: size.width / 20),
                          ],
                        ),
                      ],
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
