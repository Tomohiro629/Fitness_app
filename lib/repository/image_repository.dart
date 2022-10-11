import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/entity/image.dart';

import '../service/common_method.dart';

final imageRepositoryProvider = Provider(((ref) {
  return ImageRepository();
}));

class ImageRepository {
  final _firestore = FirebaseFirestore.instance;

  Stream<List<Image>> fetchImageStream() {
    final snapshots = _firestore.collection('records').snapshots();
    return snapshots.map(((qs) => qs.docs.isEmpty
        ? []
        : qs.docs.map((doc) => Image.fromJson(doc.data())).toList()));
  }

  Future<void> setRecord({required Image image}) async {
    await _firestore
        .collection("images")
        .doc(getDateString(DateTime.now()))
        .set(image.toJson(), SetOptions(merge: true));
  }
}
