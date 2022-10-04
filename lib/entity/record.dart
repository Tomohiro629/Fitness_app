import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karaoke_app/service/common_method.dart';

class Record {
  Record({
    required this.recordId,
    required this.totalCalorie,
    required this.setCalorie,
    required this.totalProtein,
    required this.setProtein,
    required this.recordTime,
    required this.userId,
  });

  factory Record.create({
    required int totalCalorie,
    required int setCalorie,
    required int totalProtein,
    required int setProtein,
    required String userId,
  }) {
    return Record(
      recordId: getDateString(DateTime.now()),
      totalCalorie: totalCalorie,
      setCalorie: setCalorie,
      totalProtein: totalProtein,
      setProtein: setProtein,
      recordTime: DateTime.now(),
      userId: userId,
    );
  }

  Record update({required int totalCalorie, required int totalProtein}) {
    return _copyWith(
      totalCalorie: totalCalorie,
      totalProtein: totalProtein,
    );
  }

  Record _copyWith({
    int? totalCalorie,
    int? totalProtein,
  }) {
    return Record(
      recordId: recordId,
      totalCalorie: totalCalorie ?? this.totalCalorie,
      setCalorie: setCalorie,
      totalProtein: totalProtein ?? this.totalProtein,
      setProtein: setProtein,
      recordTime: DateTime.now(),
      userId: userId,
    );
  }

  factory Record.fromJson(Map<String, dynamic> map) {
    return Record(
      recordId: map['recordId'],
      totalCalorie: map['totalCalorie'],
      setCalorie: map['setCalorie'],
      totalProtein: map['totalProtein'],
      setProtein: map['setProtein'],
      recordTime: (map['recordTime'] as Timestamp).toDate(),
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recordId': recordId,
      'totalCalorie': totalCalorie,
      'setCalorie': setCalorie,
      'totalProtein': totalProtein,
      'setProtein': setProtein,
      'recordTime': recordTime,
      'userId': userId,
    };
  }

  final String recordId;
  final int totalCalorie;
  final int setCalorie;
  final int totalProtein;
  final int setProtein;
  final DateTime recordTime;
  final String userId;
}
