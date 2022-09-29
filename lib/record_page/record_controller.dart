import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/entity/record.dart';
import 'package:karaoke_app/repository/daily_record_repository.dart';

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
    final userId = _reader(authServiceProvider).userId;
    return _reader(recordRepositoryProvider).queryDailyRecord(userId);
  }

  Future<void> setDailyRecord(
      {required int totalCalorie, required int totalProtein}) async {
    final userId = _reader(authServiceProvider).userId;
    final record = Record.create(
      userId: userId,
      totalCalorie: totalCalorie,
      totalProtein: totalProtein,
    );
    return await _reader(recordRepositoryProvider).setRecord(record: record);
  }
}
