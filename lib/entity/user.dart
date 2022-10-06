import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    required this.calorie,
    required this.protein,
    required this.weight,
    required this.recordTime,
    required this.userId,
    required this.userName,
  });

  factory User.create(
      {required int calorie,
      required double protein,
      required double weight,
      required String userId,
      required String userName}) {
    return User(
        calorie: calorie,
        protein: protein,
        weight: weight,
        recordTime: DateTime.now(),
        userId: userId,
        userName: userName);
  }

  User update({
    required int calorie,
    required double protein,
    required double weight,
  }) {
    return _copyWith(calorie: calorie, protein: protein, weight: weight);
  }

  User _copyWith({
    int? calorie,
    double? protein,
    double? weight,
  }) {
    return User(
        calorie: calorie ?? this.calorie,
        protein: protein ?? this.protein,
        weight: weight ?? this.weight,
        recordTime: DateTime.now(),
        userId: userId,
        userName: userName);
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
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
  final double protein;
  final double weight;
  final DateTime recordTime;
  final String userId;
  final String userName;
}
