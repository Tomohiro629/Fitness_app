import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/user.dart';

final userRepositoryProvider = Provider(((ref) {
  return UserRepository();
}));

class UserRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> setUser({
    required User user,
  }) async {
    try {
      await _firestore
          .collection("users")
          .doc(user.userId)
          .set(user.toJson(), SetOptions(merge: true));
    } catch (e) {
      const Dialog(
        child: Text("Registartion Error"),
      );
    }
  }

  Future<void> deleteUser(String userId) async {
    await _firestore.collection("users").doc(userId).delete();
  }

  Stream<User?> fetchUserStream(String userId) {
    final snapshots = _firestore.collection('users').doc(userId).snapshots();

    return snapshots
        .map(((doc) => doc.data() == null ? null : User.fromJson(doc.data()!)));
  }

  Future<User> getUserDate({required String userId}) async {
    final snapshot = await _firestore.collection("users").doc(userId).get();
    return User.fromJson(snapshot.data()!);
  }
}
