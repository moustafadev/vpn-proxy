import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy_line/core/constants/constant.dart';
import 'package:proxy_line/core/provider/app_data.dart';
import 'package:proxy_line/core/repository/objects/access_ips.dart';
import 'package:proxy_line/core/repository/objects/auth.dart';
import 'package:proxy_line/core/repository/objects/countries.dart';
import 'package:proxy_line/core/repository/objects/ips.dart';
import 'package:proxy_line/core/repository/objects/message.dart';
import 'package:proxy_line/core/repository/objects/objects.dart';
import 'package:proxy_line/core/repository/objects/proxies.dart';
import 'package:proxy_line/core/repository/objects/success.dart';
import 'package:proxy_line/core/repository/objects/tag.dart';
import 'package:proxy_line/core/repository/objects/user.dart';

import 'objects/order.dart';

enum Method { get, post, put, delete, patch }

class Repository {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: apiUrl,
      receiveTimeout: 100000,
      connectTimeout: 100000,
      headers: {
        "apiKey": 'project-1-apikey',
      },
    ),
  );

  final BuildContext context;
  Repository({
    required this.context,
  });
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(value)));
  }

  Future<SuccessAnswer?> verificationCode(String email) async {
    Response response =
        await dio.post("verification-code/", data: {"email": email});

    print(response.data);

    try {
      var answer = SuccessAnswer.fromJson(response.data);
      return answer;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserAnswer?> createUser(String email, String code) async {
    Response response = await dio.post("user/", data: {
      "email": email,
      "email_code": code,
    });

    print(response.data);

    try {
      var answer = UserAnswer.fromJson(response.data);
      print('user created');
      return answer;
    } catch (e) {
      print('user is not created');
      return null;
    }
  }

  Future<UserAnswer?> authUser(String email, String password) async {
    Response response = await dio.post("auth-user/", data: {
      "email": email,
      "password": password,
    });

    print(response.data);

    try {
      print(AuthAnswer.fromJson(response.data).user.token);
      var answer = AuthAnswer.fromJson(response.data).user;
      print('user is auth');
      return answer;
    } catch (e) {
      print('user is not auth');
      return null;
    }
  }

  Future<List<ProxiesAnswer>?> getProxies() async {
    var user = Provider.of<AppData>(context, listen: false).user;
    Response response =
        await dio.get("user/${user.userId}:${user.token}/proxies/");

    print(response.data);

    try {
      var answer = List<ProxiesAnswer>.from(
          response.data.map((x) => ProxiesAnswer.fromJson(x)));
      print('proxies good');
      return answer;
    } catch (e) {
      print('proxies not good');
      return null;
    }
  }

  Future<List<CountriesAnswer>?> getCountries() async {
    var user = Provider.of<AppData>(context, listen: false).user;
    Response response = await dio.get("countries/");

    print(response.data);

    try {
      var answer = List<CountriesAnswer>.from(
          response.data.map((x) => CountriesAnswer.fromJson(x)));
      print('proxies good');
      return answer;
    } catch (e) {
      print('proxies not good');
      return null;
    }
  }

  Future<Balance?> getBalance() async {
    var user = Provider.of<AppData>(context, listen: false).user;
    print(user.userId);
    print(user.token);
    Response response = await dio.get(
      "user/${user.userId}:${user.token}/balances/",
    );

    print(response.data);

    try {
      var answer = Balance.fromJson(response.data);
      print('balance ok');
      return answer;
    } catch (e) {
      print('balance is not ok');
      return null;
    }
  }

  Future<SendMessage?> createMessage(String message) async {
    var user = Provider.of<AppData>(context, listen: false).user;
    print(message);
    Response response = await dio.post(
        "user/${user.userId}:${user.token}/message/",
        data: {"text": message});

    print(response.data);

    try {
      var answer = SendMessage.fromJson(response.data);
      print('Message good');
      return answer;
    } catch (e) {
      print('message not good');
      return null;
    }
  }

  Future<Order?> getOrder() async {
    var user = Provider.of<AppData>(context, listen: false).user;
    print(user.userId);
    print(user.token);
    Response response = await dio.get(
      "order-limits/",
    );

    print(response.data);

    try {
      var answer = Order.fromJson(response.data);
      print('order ok');
      return answer;
    } catch (e) {
      print('order is not ok');
      return null;
    }
  }

  Future<List?> getPeriods() async {
    var user = Provider.of<AppData>(context, listen: false).user;
    print(user.userId);
    print(user.token);
    Response response = await dio.get(
      "order-periods/",
    );

    print(response.data);

    try {
      print('periods ok');
      return response.data;
    } catch (e) {
      print('periods is not ok');
      return null;
    }
  }

  Future<Order?> getPrices() async {
    var user = Provider.of<AppData>(context, listen: false).user;
    print(user.userId);
    print(user.token);
    Response response = await dio.get(
      "proxy-prices/",
    );

    print(response.data);

    try {
      var answer = Order.fromJson(response.data);
      print('balance ok');
      return answer;
    } catch (e) {
      print('balance is not ok');
      return null;
    }
  }

  Future<List<Ips>?> getIps(String country, int ip_type, int ip_version) async {
    var user = Provider.of<AppData>(context, listen: false).user;
    print(user.userId);
    print(user.token);
    Response response = await dio.get("user/${user.userId}:${user.token}/ips/",
        queryParameters: {
          "country": country,
          "ip_type": ip_type,
          "ip_version": ip_version,
          'query': 6
        });

    print(response.data);
    try {
      var answer = List<Ips>.from(response.data.map((x) => Ips.fromJson(x)));
      print('proxies good');
      return answer;
    } catch (e) {
      print('proxies not good');
      return null;
    }
  }

  Future<List<AccessIps>?> getAccessIp() async {
    var user = Provider.of<AppData>(context, listen: false).user;
    print(user.userId);
    print(user.token);
    Response response = await dio
        .get("user/${user.userId}:${user.token}/accessips/", queryParameters: {
      "limit": 100,
      "offset": 0,
    });

    print(response.data);

    try {
      var answer =
          List<AccessIps>.from(response.data.map((x) => AccessIps.fromJson(x)));
      print('AccessIps ok');
      return answer;
    } catch (e) {
      print('AccessIps is not ok');
      return null;
    }
  }

  Future<List<Tags>?> getTags() async {
    var user = Provider.of<AppData>(context, listen: false).user;
    print(user.userId);
    print(user.token);
    Response response = await dio
        .get("user/${user.userId}:${user.token}/tags/", queryParameters: {
      "limit": 100,
      "offset": 0,
    });

    print(response.data);

    try {
      var answer = List<Tags>.from(response.data.map((x) => Tags.fromJson(x)));
      print('Tags ok');
      return answer;
    } catch (e) {
      print('Tags is not ok');
      return null;
    }
  }
}
