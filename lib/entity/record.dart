import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Record {
  Record({
    required this.recordId,
    required this.calorie,
    required this.protein,
    required this.weight,
    required this.recordTime,
    required this.userId,
    required this.userName,
  });

  factory Record.create(
      {required double calorie,
      required double protein,
      required double weight,
      required String userId,
      required String userName}) {
    return Record(
        recordId: const Uuid().v4(),
        calorie: calorie,
        protein: protein,
        weight: weight,
        recordTime: DateTime.now(),
        userId: userId,
        userName: userName);
  }

  factory Record.fromJson(Map<String, dynamic> map) {
    return Record(
      recordId: map['recordId'],
      calorie: map['calorie'],
      protein: map['protein'],
      weight: map['weight'],
      recordTime: (map['recordTime'] as Timestamp).toDate(),
      userId: map['userId'],
      userName: map['userName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recordId': recordId,
      'calorie': calorie,
      'protein': protein,
      'weight': weight,
      'recordTime': recordTime,
      'userId': userId,
      'userName': userName,
    };
  }

  final String recordId;
  final double calorie;
  final double protein;
  final double weight;
  final DateTime recordTime;
  final String userId;
  final String userName;
}
