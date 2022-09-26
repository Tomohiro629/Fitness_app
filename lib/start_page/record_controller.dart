import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/entity/record.dart';
import 'package:karaoke_app/repository/record_repository.dart';

import '../service/auth_service.dart';

final recordControllerProvider =
    ChangeNotifierProvider<RecordController>((ref) {
  return RecordController(ref.read);
});

class RecordController extends ChangeNotifier {
  final Reader _reader;
  String errorMessage = "";
  RecordController(this._reader);

  Query<Record> recordQuery() {
    final userId = _reader(authServiceProvider).userId;
    return _reader(recordRepositoryProvider).queryRecord(userId);
  }
}
