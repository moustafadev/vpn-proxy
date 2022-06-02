import 'dart:convert';

class SendMessage {
  SendMessage({
    required this.success,
  });

  bool success;

  factory SendMessage.fromJson(Map<String, dynamic> json) {
    return SendMessage(
      success: json["success"],
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
      };
}
