import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/entity/record.dart';
import 'package:karaoke_app/service/common_method.dart';

import '../entity/daily_record.dart';

final dailyRecordRepositoryProvider = Provider(((ref) {
  return DailyRecordRepository();
}));

class DailyRecordRepository {
  final _firestore = FirebaseFirestore.instance;

  Stream<DailyRecord?> fetchDailyRecord(String userId) {
    final snapshots = _firestore
        .collection('records')
        .doc(userId)
        .collection("daily_records")
        .doc(getDateString(DateTime.now()))
        .snapshots();
    return snapshots.map(((doc) =>
        doc.data() == null ? null : DailyRecord.fromJson(doc.data()!)));
  }

  Future<void> setDailyRecord({required DailyRecord dailyRecord}) async {
    try {
      await _firestore
          .collection("records")
          .doc(dailyRecord.userId)
          .collection("daily_records")
          .doc(getDateString(dailyRecord.recordTime))
          .set(dailyRecord.toJson(), SetOptions(merge: true));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Query<DailyRecord> queryDailyRecord({required Record record}) {
    final query = _firestore
        .collection("records")
        .doc(record.userId)
        .collection("daily_records");
    return query.withConverter(
        fromFirestore: (snapshot, _) => DailyRecord.fromJson(snapshot.data()!),
        toFirestore: (record, _) => record.toJson());
  }
}
