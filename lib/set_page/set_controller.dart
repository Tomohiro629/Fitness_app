import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/entity/user.dart';
import 'package:karaoke_app/repository/user_repository.dart';

import '../service/auth_service.dart';

final setControllerProvider = ChangeNotifierProvider<SetController>((ref) {
  return SetController(ref.read);
});

class SetController extends ChangeNotifier {
  final Reader _reader;
  String errorMessage = "";
  SetController(this._reader);

  void setErrorText(String errorText) {
    errorMessage = errorText;
    notifyListeners();
  }

  Future<void> setUserDate({
    required int totalCalorie,
    required int totalProtein,
    required double weight,
    required String userName,
  }) async {
    final userId = _reader(authServiceProvider).userId;
    final user = User.create(
        calorie: totalCalorie,
        protein: totalProtein,
        weight: weight,
        userId: userId,
        userName: userName);
    await _reader(userRepositoryProvider).setUser(user: user);
  }
}
