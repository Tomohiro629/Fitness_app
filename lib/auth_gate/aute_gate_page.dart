import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/home_page/home_page.dart';
import 'package:karaoke_app/service/auth_service.dart';
import 'package:karaoke_app/start_page/start_page.dart';

class AuthGatePage extends ConsumerWidget {
  const AuthGatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUser = ref.watch(authServiceProvider).getAuthState;

    return StreamBuilder<User?>(
        stream: authUser,
        builder: ((context, snapshot) {
          final isLogin = snapshot.data != null;
          return isLogin ? const StartPage() : const HomePage();
        }));
  }
}
