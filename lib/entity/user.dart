class User {
  User({required this.userId, required this.userName});

  factory User.create({
    required String userId,
    required String userName,
  }) {
    return User(userId: userId, userName: userName);
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(userId: map['userId'], userName: map['userName']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
    };
  }

  final String userId;
  final String userName;
}
