import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/entity/record.dart';
import 'package:karaoke_app/repository/record_repository.dart';

import '../service/auth_service.dart';

final recordControllerProvider =
    ChangeNotifierProvider.family<RecordController, Record>((ref, record) {
  return RecordController(
    ref.read,
    record,
  );
});

class RecordController extends ChangeNotifier {
  final Reader _reader;
  final Record _record;
  RecordController(
    this._reader,
    this._record,
  );

  Future<void> addRecord(
      {required int addCalorie, required int addProtein}) async {
    final recordCalorie =
        _record.update(totalCalorie: addCalorie, totalProtein: addProtein);

    await _reader(recordRepositoryProvider).setRecord(record: recordCalorie);
  }

  Query<Record> recordQuery(slectedDay) {
    return _reader(recordRepositoryProvider).querySlectedDayRecord(slectedDay);
  }

  Future<void> setDailyRecord(
      {required int totalCalorie,
      required int setCalorie,
      required int totalProtein,
      required int setProtein}) async {
    final userId = _reader(authServiceProvider).userId;
    final record = Record.create(
      userId: userId,
      totalCalorie: totalCalorie,
      setCalorie: setCalorie,
      totalProtein: totalProtein,
      setProtein: setProtein,
    );
    return await _reader(recordRepositoryProvider).setRecord(record: record);
  }
}
