// To parse this JSON data, do
//
//     final proxiesAnswer = proxiesAnswerFromJson(jsonString);

import 'dart:convert';

List<ProxiesAnswer> proxiesAnswerFromJson(String str) =>
    List<ProxiesAnswer>.from(
        json.decode(str).map((x) => ProxiesAnswer.fromJson(x)));

String proxiesAnswerToJson(List<ProxiesAnswer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProxiesAnswer {
  ProxiesAnswer({
    required this.id,
    required this.ip,
    required this.internalIp,
    required this.countryId,
    required this.ipType,
    required this.ipVersion,
    required this.portHttp,
    required this.portSocks5,
    required this.username,
    required this.password,
    required this.orderId,
    required this.autoRenewal,
    required this.dateStart,
    required this.dateEnd,
  });

  int id;
  String ip;
  String internalIp;
  String countryId;
  int ipType;
  int ipVersion;
  int portHttp;
  int portSocks5;
  String username;
  String password;
  int orderId;
  int autoRenewal;
  String dateStart;
  String dateEnd;

  factory ProxiesAnswer.fromJson(Map<String, dynamic> json) => ProxiesAnswer(
        id: json["id"],
        ip: json["ip"],
        internalIp: json["internal_ip"],
        countryId: json["country_id"],
        ipType: json["ip_type"],
        ipVersion: json["ip_version"],
        portHttp: json["port_http"],
        portSocks5: json["port_socks5"],
        username: json["username"],
        password: json["password"],
        orderId: json["order_id"],
        autoRenewal: json["auto_renewal"],
        dateStart: json["date_start"],
        dateEnd: json["date_end"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ip": ip,
        "internal_ip": internalIp,
        "country_id": countryId,
        "ip_type": ipType,
        "ip_version": ipVersion,
        "port_http": portHttp,
        "port_socks5": portSocks5,
        "username": username,
        "password": password,
        "order_id": orderId,
        "auto_renewal": autoRenewal,
        "date_start": dateStart,
        "date_end": dateEnd,
      };
}
