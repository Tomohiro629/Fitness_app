class FitnessUser {
  FitnessUser({required this.userId, required this.userName});

  factory FitnessUser.create({
    required String userId,
    required String userName,
  }) {
    return FitnessUser(userId: userId, userName: userName);
  }

  factory FitnessUser.fromJson(Map<String, dynamic> map) {
    return FitnessUser(userId: map['userId'], userName: map['userName']);
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
