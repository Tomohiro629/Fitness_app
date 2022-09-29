import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/service/common_method.dart';

import '../entity/record.dart';

final recordRepositoryProvider = Provider(((ref) {
  return RecordRepository();
}));

class RecordRepository {
  final _firestore = FirebaseFirestore.instance;

  Stream<Record?> fetchDailyRecord() {
    final snapshots = _firestore
        .collection('records')
        .doc(getDateString(DateTime.now()))
        .snapshots();
    return snapshots.map(
        ((doc) => doc.data() == null ? null : Record.fromJson(doc.data()!)));
  }

  Future<void> setRecord({required Record record}) async {
    try {
      await _firestore
          .collection("records")
          .doc(record.recordTime.toString())
          .set(record.toJson(), SetOptions(merge: true));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Query<Record> queryDailyRecord(userId) {
    final query = _firestore
        .collection("records")
        .doc(userId)
        .collection("daily_records");
    return query.withConverter(
        fromFirestore: (snapshot, _) => Record.fromJson(snapshot.data()!),
        toFirestore: (record, _) => record.toJson());
  }
}
