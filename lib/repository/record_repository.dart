import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/record.dart';
import '../service/common_method.dart';

final recordRepositoryProvider = Provider(((ref) {
  return RecordRepository();
}));

class RecordRepository {
  final _firestore = FirebaseFirestore.instance;

  Stream<Record?> fetchRecord() {
    final snapshots = _firestore
        .collection('records')
        .doc(getDateString(DateTime.now()))
        .snapshots();
    return snapshots.map(
        ((doc) => doc.data() == null ? null : Record.fromJson(doc.data()!)));
  }

  Stream<List<Record>> fetchRecordStream() {
    final snapshot = _firestore.collection('stores').snapshots();

    return snapshot.map(
        (qs) => qs.docs.map((doc) => Record.fromJson(doc.data())).toList());
  }

  Future<void> setRecord({required Record record}) async {
    try {
      await _firestore
          .collection("records")
          .doc(getDateString(DateTime.now()))
          .set(record.toJson(), SetOptions(merge: true));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Query<Record> querySlectedDayRecord(slectedDay) {
    final query = _firestore
        .collection('records')
        .where('recordId', isEqualTo: getDateString(slectedDay));
    return query.withConverter(
        fromFirestore: (snapshot, _) => Record.fromJson(snapshot.data()!),
        toFirestore: (record, _) => record.toJson());
  }

  Query<Record> queryRecord() {
    final query = _firestore.collection("records");
    return query.withConverter(
        fromFirestore: (snapshot, _) => Record.fromJson(snapshot.data()!),
        toFirestore: (record, _) => record.toJson());
  }
}
