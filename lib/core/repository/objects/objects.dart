// To parse this JSON data, do
//
//     final balance = balanceFromJson(jsonString);

import 'dart:convert';

Balance balanceFromJson(String str) => Balance.fromJson(json.decode(str));

String balanceToJson(Balance data) => json.encode(data.toJson());

class Balance {
  Balance({
    required this.balance,
    required this.partnerBalance,
  });

  int balance;
  int partnerBalance;

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        balance: json["balance"],
        partnerBalance: json["partner_balance"],
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
        "partner_balance": partnerBalance,
      };
}
