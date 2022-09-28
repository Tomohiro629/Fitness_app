import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/entity/daily_record.dart';
import 'package:karaoke_app/entity/record.dart';
import 'package:karaoke_app/repository/daily_record_repository.dart';
import 'package:karaoke_app/repository/record_repository.dart';

import '../service/auth_service.dart';

final recordControllerProvider = ChangeNotifierProvider<RecordController>((
  ref,
) {
  return RecordController(
    ref.read,
  );
});

class RecordController extends ChangeNotifier {
  final Reader _reader;

  RecordController(
    this._reader,
  );

  Query<DailyRecord> dailyRecordQuery() {
    final userId = _reader(authServiceProvider).userId;
    return _reader(dailyRecordRepositoryProvider).queryDailyRecord(userId);
  }

  Query<Record> recordQuery() {
    final userId = _reader(authServiceProvider).userId;
    return _reader(recordRepositoryProvider).queryRecord(userId);
  }

  Future<void> setDailyRecord(
      {required int dayTotalCalorie, required int dayTotalProtein}) async {
    final userId = _reader(authServiceProvider).userId;
    final dailyRecord = DailyRecord.create(
      dayTotalCalorie: dayTotalCalorie,
      dayTotalProtein: dayTotalProtein,
      userId: userId,
    );
    return await _reader(dailyRecordRepositoryProvider)
        .setDailyRecord(dailyRecord: dailyRecord);
  }

  Future<void> setAddCalorie(
      {required Record record, required int addCalorie}) async {
    try {
      await _reader(recordRepositoryProvider)
          .setRecord(record: record.addTotalCalorie(addCalorie));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> setAddProtein(
      {required Record record, required int addProtein}) async {
    try {
      await _reader(recordRepositoryProvider)
          .setRecord(record: record.addTotalProtein(addProtein));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
