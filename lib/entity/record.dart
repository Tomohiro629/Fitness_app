import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Record {
  Record(
      {required this.recordId,
      required this.title,
      required this.artist,
      required this.playTime,
      required this.recordTime,
      required this.userId});

  factory Record.create(
      {required String recordId,
      required String title,
      required String artist,
      required int playTime,
      required int recordTime,
      required String userId}) {
    return Record(
        recordId: const Uuid().v4(),
        title: title,
        artist: artist,
        playTime: playTime,
        recordTime: DateTime.now(),
        userId: userId);
  }

  factory Record.fromJson(Map<String, dynamic> map) {
    return Record(
      recordId: map['recordId'],
      title: map['title'],
      artist: map['artist'],
      playTime: map['playTime'],
      recordTime: (map['recordTime'] as Timestamp).toDate(),
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recordId': recordId,
      'title': title,
      'artist': artist,
      'playTime': playTime,
      'recordTime': recordTime,
      'userId': userId,
    };
  }

  final String recordId;
  final String title;
  final String artist;
  final int playTime;
  final DateTime recordTime;
  final String userId;
}
