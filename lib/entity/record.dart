import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Record {
  Record(
      {required this.recordId,
      required this.calorie,
      required this.protein,
      required this.weight,
      required this.recordTime,
      required this.userId});

  factory Record.create(
      {required String recordId,
      required double calorie,
      required double protein,
      required double weight,
      required int recordTime,
      required String userId}) {
    return Record(
        recordId: const Uuid().v4(),
        calorie: calorie,
        protein: protein,
        weight: weight,
        recordTime: DateTime.now(),
        userId: userId);
  }

  factory Record.fromJson(Map<String, dynamic> map) {
    return Record(
      recordId: map['recordId'],
      calorie: map['calorie'],
      protein: map['protein'],
      weight: map['weight'],
      recordTime: (map['recordTime'] as Timestamp).toDate(),
      userId: map['userId'],
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
    };
  }

  final String recordId;
  final double calorie;
  final double protein;
  final double weight;
  final DateTime recordTime;
  final String userId;
}
