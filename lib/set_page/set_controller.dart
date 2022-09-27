import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/entity/daily_record.dart';
import 'package:karaoke_app/entity/record.dart';
import 'package:karaoke_app/repository/daily_record_repository.dart';
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
    required int totalCalorie,
    required int totalProtein,
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

  Future<void> setDailyRecord() async {
    final userId = _reader(authServiceProvider).userId;
    final dailyRecord = DailyRecord.create(
      userId: userId,
      dayTotalCalorie: 0,
      dayTotalProtein: 0,
    );
    await _reader(dailyRecordRepositoryProvider)
        .setDailyRecord(dailyRecord: dailyRecord);
    notifyListeners();
  }
}
