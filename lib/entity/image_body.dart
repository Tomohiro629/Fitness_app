import 'package:cloud_firestore/cloud_firestore.dart';

class ImageBody {
  ImageBody({
    required this.imageURL,
    required this.recordTime,
    required this.userId,
  });

  factory ImageBody.create({
    required String imageURL,
    required String userId,
  }) {
    return ImageBody(
      imageURL: imageURL,
      recordTime: DateTime.now(),
      userId: userId,
    );
  }

  factory ImageBody.fromJson(Map<String, dynamic> map) {
    return ImageBody(
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
