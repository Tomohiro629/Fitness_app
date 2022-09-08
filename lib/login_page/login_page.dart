import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/login_page/components/input_from_filed.dart';
import 'package:karaoke_app/login_page/components/login_button.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);
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
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const InputFromFiled(
                          icon: Icons.account_circle_outlined,
                          hintText: 'User name...',
                        ),
                        const InputFromFiled(
                          icon: Icons.email_outlined,
                          hintText: 'Mail address...',
                        ),
                        const InputFromFiled(
                          icon: Icons.lock_outline,
                          hintText: 'Password...',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const LoginButton(),
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
