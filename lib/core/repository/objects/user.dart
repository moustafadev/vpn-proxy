// To parse this JSON data, do
//
//     final userAnswer = userAnswerFromJson(jsonString);

import 'dart:convert';

UserAnswer userAnswerFromJson(String str) =>
    UserAnswer.fromJson(json.decode(str));

String userAnswerToJson(UserAnswer data) => json.encode(data.toJson());

class UserAnswer {
  UserAnswer({
    required this.userId,
    required this.token,
  });

  int userId;
  String token;

  factory UserAnswer.fromJson(Map<String, dynamic> json) => UserAnswer(
        userId: json["id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": userId,
        "token": token,
      };
}
