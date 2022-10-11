import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/entity/image_body.dart';

import '../service/common_method.dart';

final imageRepositoryProvider = Provider(((ref) {
  return ImageRepository();
}));

class ImageRepository {
  final _firestore = FirebaseFirestore.instance;

  Stream<List<ImageBody>> fetchImageStream() {
    final snapshots = _firestore.collection('images').snapshots();
    return snapshots.map(((qs) => qs.docs.isEmpty
        ? []
        : qs.docs.map((doc) => ImageBody.fromJson(doc.data())).toList()));
  }

  Future<void> setImage({required ImageBody image}) async {
    await _firestore
        .collection("images")
        .doc(getDateString(DateTime.now()))
        .set(image.toJson(), SetOptions(merge: true));
  }
}
