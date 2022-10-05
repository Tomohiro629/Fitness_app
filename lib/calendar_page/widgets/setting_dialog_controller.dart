import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/repository/user_repository.dart';

import '../../entity/user.dart';

final settingControllerProvider =
    ChangeNotifierProvider<SettingController>((ref) {
  return SettingController(
    ref.read,
  );
});

class SettingController extends ChangeNotifier {
  final Reader _reader;
  SettingController(
    this._reader,
  );

  Future<void> fixCalorie({
    required User user,
    required int setCalorie,
  }) async {
    final fixCalorie = user.update(
        calorie: setCalorie, protein: user.protein, weight: user.weight);
    await _reader(userRepositoryProvider).setUser(user: fixCalorie);
  }

  Future<void> fixProtein({
    required User user,
    required int setProtein,
  }) async {
    final fixCalorie = user.update(
        calorie: user.calorie, protein: setProtein, weight: user.weight);
    await _reader(userRepositoryProvider).setUser(user: fixCalorie);
  }
}
