import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Record {
  Record({
    required this.recordId,
    required this.calorie,
    required this.todayCalorie,
    required this.protein,
    required this.todayProtein,
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
        todayCalorie: 0,
        protein: protein,
        todayProtein: 0,
        weight: weight,
        recordTime: DateTime.now(),
        userId: userId,
        userName: userName);
  }

  Record update({
    required double calorie,
    required double protein,
    required double weight,
  }) {
    return _copyWith(calorie: calorie, protein: protein, weight: weight);
  }

  Record _copyWith(
      {double? calorie,
      double? protein,
      double? weight,
      int? todayCalorie,
      int? todayProtein}) {
    return Record(
        recordId: recordId,
        calorie: calorie ?? this.calorie,
        todayCalorie: todayCalorie ?? 0,
        protein: protein ?? this.protein,
        todayProtein: todayProtein ?? 0,
        weight: weight ?? this.weight,
        recordTime: recordTime,
        userId: userId,
        userName: userName);
  }

  factory Record.fromJson(Map<String, dynamic> map) {
    return Record(
      recordId: map['recordId'],
      calorie: map['calorie'],
      todayCalorie: map['todayCalorie'],
      protein: map['protein'],
      todayProtein: map['todayProtein'],
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
      'todayCalorie': todayCalorie,
      'protein': protein,
      'todayProtein': todayProtein,
      'weight': weight,
      'recordTime': recordTime,
      'userId': userId,
      'userName': userName,
    };
  }

  final String recordId;
  final double calorie;
  final int todayCalorie;
  final double protein;
  final int todayProtein;
  final double weight;
  final DateTime recordTime;
  final String userId;
  final String userName;
}
