import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/user.dart';
import '../repository/user_repository.dart';

final userServiceProvider = ChangeNotifierProvider<UserService>((ref) {
  return UserService(ref.read);
});

class UserService extends ChangeNotifier {
  final Reader _reader;
  UserService(this._reader);

  Future<void> addUser({
    required String userName,
    required String userId,
  }) async {
    try {
      final user = User.create(
        userName: userName,
        userId: userId,
      );
      await _reader(userRepositoryProvider).setUser(
        user: user,
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> deleteUser(String userId) async {
    await _reader(userRepositoryProvider).deleteUser(userId);
  }

  Stream<User?> fetchUserStream(String userId) {
    return _reader(userRepositoryProvider).fetchUserStream(userId);
  }
}
