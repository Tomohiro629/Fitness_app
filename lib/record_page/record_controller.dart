import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/entity/record.dart';
import 'package:karaoke_app/repository/repository.dart';

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

  Query<Record> recordQuery() {
    return _reader(recordRepositoryProvider).queryRecord();
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
