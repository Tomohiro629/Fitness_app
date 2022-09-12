import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/entity/record.dart';

final recordRepositoryProvider = Provider(((ref) {
  return RecordRepository();
}));

class RecordRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> deleteRecord(recordId) async {
    await _firestore.collection("records").doc(recordId).delete();
  }

  Future<void> setRecord({required Record record}) async {
    try {
      await _firestore
          .collection("records")
          .doc(record.recordId)
          .set(record.toJson(), SetOptions(merge: true));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Query<Record> queryRecord(String userId) {
    final query =
        _firestore.collection("records").where("userId", isEqualTo: userId);
    return query.withConverter(
        fromFirestore: (snapshot, _) => Record.fromJson(snapshot.data()!),
        toFirestore: (record, _) => record.toJson());
  }
}
