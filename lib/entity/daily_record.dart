import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class DailyRecord {
  DailyRecord({
    required this.dailyRecordId,
    required this.dayTotalCalorie,
    required this.dayTotalProtein,
    required this.recordTime,
    required this.userId,
  });

  factory DailyRecord.create({
    required int dayTotalCalorie,
    required int dayTotalProtein,
    required String userId,
  }) {
    return DailyRecord(
      dailyRecordId: const Uuid().v4(),
      dayTotalCalorie: dayTotalCalorie,
      dayTotalProtein: dayTotalProtein,
      recordTime: DateTime.now(),
      userId: userId,
    );
  }

  DailyRecord update(
      {required int dayTotalCalorie, required int dayTotalProtein}) {
    return _copyWith(
      dayTotalCalorie: dayTotalCalorie,
      dayTotalProtein: dayTotalProtein,
    );
  }

  DailyRecord _copyWith({
    int? dayTotalCalorie,
    int? dayTotalProtein,
  }) {
    return DailyRecord(
      dailyRecordId: dailyRecordId,
      dayTotalCalorie: dayTotalCalorie ?? this.dayTotalCalorie,
      dayTotalProtein: dayTotalProtein ?? this.dayTotalProtein,
      recordTime: recordTime,
      userId: userId,
    );
  }

  factory DailyRecord.fromJson(Map<String, dynamic> map) {
    return DailyRecord(
      dailyRecordId: map['dailyRecordId'],
      dayTotalCalorie: map['dayTotalCalorie'],
      dayTotalProtein: map['dayTotalProtein'],
      recordTime: (map['recordTime'] as Timestamp).toDate(),
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dailyRecordId': dailyRecordId,
      'dayTotalCalorie': dayTotalCalorie,
      'dayTotalProtein': dayTotalProtein,
      'recordTime': recordTime,
      'userId': userId,
    };
  }

  final String dailyRecordId;

  final int dayTotalCalorie;

  final int dayTotalProtein;
  final DateTime recordTime;
  final String userId;
}
