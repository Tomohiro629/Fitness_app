import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/record.dart';
import '../repository/record_repository.dart';
import '../service/auth_service.dart';

final recordControllerProvider =
    ChangeNotifierProvider<RecordController>((ref) {
  return RecordController(
    ref.read,
  );
});

class RecordController extends ChangeNotifier {
  final Reader _reader;
  RecordController(
    this._reader,
  );

  Future<void> addRecord(
      {required Record record,
      required int addCalorie,
      required double addProtein}) async {
    final recordCalorie =
        record.update(totalCalorie: addCalorie, totalProtein: addProtein);

    await _reader(recordRepositoryProvider).setRecord(record: recordCalorie);
  }

  Query<Record> recordQuery(slectedDay) {
    return _reader(recordRepositoryProvider).querySlectedDayRecord(slectedDay);
  }

  Future<void> setDailyRecord(
      {required int totalCalorie,
      required int setCalorie,
      required double totalProtein,
      required double setProtein}) async {
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
