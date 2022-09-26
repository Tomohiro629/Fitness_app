import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class DailyRecord {
  DailyRecord({
    required this.dailyRecordId,
    required this.dailyCalorie,
    required this.dailyProtein,
    required this.recordTime,
    required this.userId,
  });

  factory DailyRecord.create({
    required int dailyCalorie,
    required int dailyProtein,
    required String userId,
  }) {
    return DailyRecord(
      dailyRecordId: const Uuid().v4(),
      dailyCalorie: dailyCalorie,
      dailyProtein: dailyProtein,
      recordTime: DateTime.now(),
      userId: userId,
    );
  }

  DailyRecord update({
    required int dailyCalorie,
    required int dailyProtein,
  }) {
    return _copyWith(
      dailyCalorie: dailyCalorie,
      dailyProtein: dailyProtein,
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
    int? dailyProtein,
  }) {
    return DailyRecord(
      dailyRecordId: dailyRecordId,
      dailyCalorie: dailyCalorie ?? this.dailyCalorie,
      dailyProtein: dailyProtein ?? this.dailyProtein,
      recordTime: recordTime,
      userId: userId,
    );
  }

  factory DailyRecord.fromJson(Map<String, dynamic> map) {
    return DailyRecord(
      dailyRecordId: map['dailyRecordId'],
      dailyCalorie: map['dailyCalorie'],
      dailyProtein: map['dailyProtein'],
      recordTime: (map['recordTime'] as Timestamp).toDate(),
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dailyRecordId': dailyRecordId,
      'dailyCalorie': dailyCalorie,
      'dailyProtein': dailyProtein,
      'recordTime': recordTime,
      'userId': userId,
    };
  }

  final String dailyRecordId;
  final int dailyCalorie;
  final int dailyProtein;
  final DateTime recordTime;
  final String userId;
}
