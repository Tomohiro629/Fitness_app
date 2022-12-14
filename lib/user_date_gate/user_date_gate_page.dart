import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../calendar_page/calendar_page.dart';
import '../entity/user.dart';
import '../repository/user_repository.dart';
import '../service/auth_service.dart';
import '../set_page/set_page.dart';

class UserDateGatePage extends ConsumerWidget {
  const UserDateGatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(authServiceProvider).userId;
    final currentUser = ref.watch(userRepositoryProvider).fetchUser(userId);

    return StreamBuilder<User?>(
        stream: currentUser,
        builder: ((context, snapshot) {
          final isExist = snapshot.data != null;
          return isExist
              ? CalendarPage(
                  user: snapshot.data!,
                )
              : const SetPage();
        }));
  }
}
