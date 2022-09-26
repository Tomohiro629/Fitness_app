import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class DailyRecord {
  DailyRecord({
    required this.dailyRecordId,
    required this.dailyCalorie,
    required this.dailyProtein,
    required this.dailyWeight,
    required this.recordTime,
    required this.userId,
  });

  factory DailyRecord.create({
    required double dailyCalorie,
    required double dailyProtein,
    required double dailyWeight,
    required String userId,
  }) {
    return DailyRecord(
      dailyRecordId: const Uuid().v4(),
      dailyCalorie: dailyCalorie,
      dailyProtein: dailyProtein,
      dailyWeight: dailyWeight,
      recordTime: DateTime.now(),
      userId: userId,
    );
  }

  DailyRecord update({
    required double dailyCalorie,
    required double dailyProtein,
    required double dailyWeight,
  }) {
    return _copyWith(
        dailyCalorie: dailyCalorie,
        dailyProtein: dailyProtein,
        dailyWeight: dailyWeight);
  }

  DailyRecord _copyWith(
      {double? dailyCalorie, double? dailyProtein, double? dailyWeight}) {
    return DailyRecord(
      dailyRecordId: dailyRecordId,
      dailyCalorie: dailyCalorie ?? this.dailyCalorie,
      dailyProtein: dailyProtein ?? this.dailyProtein,
      dailyWeight: dailyWeight ?? this.dailyWeight,
      recordTime: recordTime,
      userId: userId,
    );
  }

  factory DailyRecord.fromJson(Map<String, dynamic> map) {
    return DailyRecord(
      dailyRecordId: map['dailyRecordId'],
      dailyCalorie: map['dailyCalorie'],
      dailyProtein: map['dailyProtein'],
      dailyWeight: map['dailyWeight'],
      recordTime: (map['recordTime'] as Timestamp).toDate(),
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dailyRecordId': dailyRecordId,
      'dailyCalorie': dailyCalorie,
      'dailyProtein': dailyProtein,
      'weight': dailyWeight,
      'recordTime': recordTime,
      'userId': userId,
    };
  }

  final String dailyRecordId;
  final double dailyCalorie;
  final double dailyProtein;
  final double dailyWeight;
  final DateTime recordTime;
  final String userId;
}
