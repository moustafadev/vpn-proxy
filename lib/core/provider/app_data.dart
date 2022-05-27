import 'package:flutter/material.dart';
import 'package:proxy_line/core/provider/shared.dart';
import 'package:proxy_line/core/repository/objects/user.dart';

class AppData extends ChangeNotifier {
  AppData(
    this._user,
    this.isOpenStories,
  );

  User _user;
  bool isOpenStories;

  User get user => _user;

  static Future<AppData> init() async {
    final prefs = await PrefsHandler.getInstance();

    return AppData(prefs.getUser(), false);
  }

  void openStories(bool isOpened) async {
    isOpenStories = isOpened;
    notifyListeners();
  }

  void setUserToken(String token) async {
    _user.token = token;
    (await PrefsHandler.getInstance()).setUserToken(token);
    notifyListeners();
  }

  void setUser(User user) async {
    (await PrefsHandler.getInstance()).setUser(user);
    _user = user;
    notifyListeners();
  }

  void logOut() async {
    (await PrefsHandler.getInstance()).logOut();
    _user = User(userId: '', token: '', email: '');
    notifyListeners();
  }
}
