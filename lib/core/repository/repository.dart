import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy_line/core/constants/constant.dart';
import 'package:proxy_line/core/provider/app_data.dart';
import 'package:proxy_line/core/repository/objects/auth.dart';
import 'package:proxy_line/core/repository/objects/countries.dart';
import 'package:proxy_line/core/repository/objects/objects.dart';
import 'package:proxy_line/core/repository/objects/proxies.dart';
import 'package:proxy_line/core/repository/objects/success.dart';
import 'package:proxy_line/core/repository/objects/user.dart';

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
}
