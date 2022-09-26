import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/entity/record.dart';

final dailyRecordRepositoryProvider = Provider(((ref) {
  return DailyRecordRepository();
}));

class DailyRecordRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> setDailyRecord({required Record record}) async {
    try {
      await _firestore
          .collection("records")
          .doc(record.userId)
          .collection("daily_records")
          .doc(record.recordTime.toString())
          .set(record.toJson(), SetOptions(merge: true));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Query<Record> queryDailyRecord({required Record record}) {
    final query = _firestore
        .collection("records")
        .doc(record.userId)
        .collection("daily_records");
    return query.withConverter(
        fromFirestore: (snapshot, _) => Record.fromJson(snapshot.data()!),
        toFirestore: (record, _) => record.toJson());
  }
}
