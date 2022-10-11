import 'package:cloud_firestore/cloud_firestore.dart';

class Image {
  Image({
    required this.imageURL,
    required this.recordTime,
    required this.userId,
  });

  factory Image.create({
    required String imageURL,
    required String userId,
  }) {
    return Image(
      imageURL: imageURL,
      recordTime: DateTime.now(),
      userId: userId,
    );
  }

  factory Image.fromJson(Map<String, dynamic> map) {
    return Image(
      imageURL: map['imageURL'],
      recordTime: (map['recordTime'] as Timestamp).toDate(),
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageURL': imageURL,
      'recordTime': recordTime,
      'userId': userId,
    };
  }

  final String imageURL;
  final DateTime recordTime;
  final String userId;
}
