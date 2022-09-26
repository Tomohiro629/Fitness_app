import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/entity/record.dart';
import 'package:karaoke_app/repository/record_repository.dart';
import 'package:karaoke_app/service/auth_service.dart';

import '../set_page/set_page.dart';
import '../start_page/record_page.dart';

class UserDateGatePage extends ConsumerWidget {
  const UserDateGatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(authServiceProvider).userId;
    final currentUser = ref.watch(recordRepositoryProvider).fetchRecord(userId);

    return StreamBuilder<Record?>(
        stream: currentUser,
        builder: ((context, snapshot) {
          final isExist = snapshot.data != null;
          return isExist ? const RecordPage() : const SetPage();
        }));
  }
}
