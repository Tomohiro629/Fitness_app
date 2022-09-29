import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/user.dart';

final userRepositoryProvider = Provider(((ref) {
  return UserRepository();
}));

class UserRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> deleteUser(userId) async {
    await _firestore.collection("users").doc(userId).delete();
  }

  Stream<User?> fetchUser(String userId) {
    final snapshots = _firestore.collection('users').doc(userId).snapshots();
    return snapshots
        .map(((doc) => doc.data() == null ? null : User.fromJson(doc.data()!)));
  }

  Future<void> setUser({required User user}) async {
    try {
      await _firestore
          .collection("users")
          .doc(user.userId)
          .set(user.toJson(), SetOptions(merge: true));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Query<User> queryUser(String userId) {
    final query =
        _firestore.collection("users").where("userId", isEqualTo: userId);
    return query.withConverter(
        fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson());
  }
}
