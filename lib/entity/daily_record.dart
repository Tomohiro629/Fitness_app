import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class DailyRecord {
  DailyRecord({
    required this.dailyRecordId,
    required this.dailyCalorie,
    required this.dayTotalCalorie,
    required this.dailyProtein,
    required this.dayTotalProtein,
    required this.recordTime,
    required this.userId,
  });

  factory DailyRecord.create({
    required int dailyCalorie,
    required int dayTotalCalorie,
    required int dailyProtein,
    required int dayTotalProtein,
    required String userId,
  }) {
    return DailyRecord(
      dailyRecordId: const Uuid().v4(),
      dailyCalorie: dailyCalorie,
      dayTotalCalorie: dayTotalCalorie,
      dailyProtein: dailyProtein,
      dayTotalProtein: dayTotalProtein,
      recordTime: DateTime.now(),
      userId: userId,
    );
  }

  DailyRecord update(
      {required int dailyCalorie,
      required int dayTotalCalorie,
      required int dailyProtein,
      required int dayTotalProtein}) {
    return _copyWith(
      dailyCalorie: dailyCalorie,
      dayTotalCalorie: dayTotalCalorie,
      dailyProtein: dailyProtein,
      dayTotalProtein: dayTotalProtein,
    );
  }

  DailyRecord totalCalorie(int addCalorie) {
    return _copyWith(dailyCalorie: addCalorie);
  }

  DailyRecord totalProtein(int addProtein) {
    return _copyWith(dailyProtein: addProtein);
  }

  DailyRecord _copyWith({
    int? dailyCalorie,
    int? dayTotalCalorie,
    int? dailyProtein,
    int? dayTotalProtein,
  }) {
    return DailyRecord(
      dailyRecordId: dailyRecordId,
      dailyCalorie: dailyCalorie ?? this.dailyCalorie,
      dayTotalCalorie: dayTotalCalorie ?? this.dayTotalCalorie,
      dailyProtein: dailyProtein ?? this.dailyProtein,
      dayTotalProtein: dayTotalProtein ?? this.dayTotalProtein,
      recordTime: recordTime,
      userId: userId,
    );
  }

  factory DailyRecord.fromJson(Map<String, dynamic> map) {
    return DailyRecord(
      dailyRecordId: map['dailyRecordId'],
      dailyCalorie: map['dailyCalorie'],
      dayTotalCalorie: map['dayTotalCalorie'],
      dailyProtein: map['dailyProtein'],
      dayTotalProtein: map['dayTotalProtein'],
      recordTime: (map['recordTime'] as Timestamp).toDate(),
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dailyRecordId': dailyRecordId,
      'dailyCalorie': dailyCalorie,
      'dayTotalCalorie': dayTotalCalorie,
      'dailyProtein': dailyProtein,
      'dayTotalProtein': dayTotalProtein,
      'recordTime': recordTime,
      'userId': userId,
    };
  }

  final String dailyRecordId;
  final int dailyCalorie;
  final int dayTotalCalorie;
  final int dailyProtein;
  final int dayTotalProtein;
  final DateTime recordTime;
  final String userId;
}
