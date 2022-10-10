import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/repository/user_repository.dart';

import '../../entity/user.dart';

final userEditControllerProvider =
    ChangeNotifierProvider.family<UserEditController, User>((ref, user) {
  return UserEditController(ref.read, user);
});

class UserEditController extends ChangeNotifier {
  final Reader _reader;
  final User user;
  UserEditController(
    this._reader,
    this.user,
  );

  Future<void> editUserDate(
      {required double weight,
      required int calorie,
      required double protein}) async {
    final editUserDate =
        user.update(calorie: calorie, protein: protein, weight: weight);
    await _reader(userRepositoryProvider).setUser(user: editUserDate);
    notifyListeners();
  }
}
