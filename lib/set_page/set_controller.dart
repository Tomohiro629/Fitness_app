import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/entity/record.dart';
import 'package:karaoke_app/repository/record_repository.dart';

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
    required double totalCalorie,
    required double totalProtein,
    required double weight,
    required String userName,
  }) async {
    final userId = _reader(authServiceProvider).userId;
    final record = Record.create(
        calorie: totalCalorie,
        protein: totalProtein,
        weight: weight,
        userId: userId,
        userName: userName);
    await _reader(recordRepositoryProvider).setRecord(record: record);
  }
}
