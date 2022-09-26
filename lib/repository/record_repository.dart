import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/entity/record.dart';

final recordRepositoryProvider = Provider(((ref) {
  return RecordRepository();
}));

class RecordRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> deleteRecord(userId) async {
    await _firestore.collection("records").doc(userId).delete();
  }

  Stream<Record?> fetchRecord(String userId) {
    final snapshots = _firestore.collection('records').doc(userId).snapshots();
    return snapshots.map(
        ((doc) => doc.data() == null ? null : Record.fromJson(doc.data()!)));
  }

  Future<void> setRecord({required Record record}) async {
    try {
      await _firestore
          .collection("records")
          .doc(record.userId)
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
