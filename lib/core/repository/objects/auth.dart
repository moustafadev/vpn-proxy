import 'dart:convert';

import 'package:proxy_line/core/repository/objects/user.dart';

AuthAnswer authAnswerFromJson(String str) =>
    AuthAnswer.fromJson(json.decode(str));

String authAnswerToJson(AuthAnswer data) => json.encode(data.toJson());

class AuthAnswer {
  AuthAnswer({
    required this.auth,
    required this.user,
  });

  bool auth;
  UserAnswer user;

  factory AuthAnswer.fromJson(Map<String, dynamic> json) => AuthAnswer(
        auth: json["auth"],
        user: UserAnswer.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "auth": auth,
        "user": user.toJson(),
      };
}
