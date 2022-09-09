import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../components/input_from_filed.dart';
import 'components/login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(
    BuildContext context,
  ) {
    final TextEditingController mailController = TextEditingController();
    final TextEditingController passController = TextEditingController();
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
                        strokeColor: Colors.indigoAccent,
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
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            InputFromFiled(
                              icon: Icons.email_outlined,
                              hintText: 'Mail address...',
                              keyboardType: TextInputType.emailAddress,
                              controller: mailController,
                            ),
                            const Gap(50),
                            InputFromFiled(
                              icon: Icons.lock_outline,
                              hintText: 'Password...',
                              keyboardType: TextInputType.visiblePassword,
                              controller: passController,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LoginButton(
                              mailAddress: mailController.text,
                              password: passController.text,
                            ),
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
