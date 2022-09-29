import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  Record({
    required this.calorie,
    required this.protein,
    required this.weight,
    required this.recordTime,
    required this.userId,
    required this.userName,
  });

  factory Record.create(
      {required int calorie,
      required int protein,
      required double weight,
      required String userId,
      required String userName}) {
    return Record(
        calorie: calorie,
        protein: protein,
        weight: weight,
        recordTime: DateTime.now(),
        userId: userId,
        userName: userName);
  }

  Record update({
    required int calorie,
    required int protein,
    required double weight,
  }) {
    return _copyWith(calorie: calorie, protein: protein, weight: weight);
  }

  Record _copyWith({
    int? calorie,
    int? protein,
    double? weight,
  }) {
    return Record(
        calorie: calorie ?? this.calorie,
        protein: protein ?? this.protein,
        weight: weight ?? this.weight,
        recordTime: DateTime.now(),
        userId: userId,
        userName: userName);
  }

  factory Record.fromJson(Map<String, dynamic> map) {
    return Record(
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
      'calorie': calorie,
      'protein': protein,
      'weight': weight,
      'recordTime': recordTime,
      'userId': userId,
      'userName': userName,
    };
  }

  final int calorie;
  final int protein;
  final double weight;
  final DateTime recordTime;
  final String userId;
  final String userName;
}
