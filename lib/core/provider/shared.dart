import 'package:proxy_line/core/repository/objects/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String userId;
  String token;
  String email;

  User({
    required this.userId,
    required this.token,
    required this.email,
  });
}

class PrefsHandler {
  PrefsHandler(this._preferences);

  final SharedPreferences _preferences;

  final String _userId = "user_id";
  final String _userToken = "user_token";
  final String _userEmail = "user_email";

  static Future<PrefsHandler> getInstance() async {
    var shared = await SharedPreferences.getInstance();
    return PrefsHandler(shared);
  }

  User getUser() {
    return User(
      userId: _preferences.getString(_userId) ?? '',
      token: _preferences.getString(_userToken) ?? '',
      email: _preferences.getString(_userEmail) ?? '',
    );
  }

  void setUser(User user) {
    _preferences.setString(_userId, user.userId);
    _preferences.setString(_userToken, user.token);
    _preferences.setString(_userEmail, user.email);
  }

  void setUserId(UserAnswer user) {
    _preferences.setInt(_userId, user.userId);
  }

  void setUserToken(String token) {
    _preferences.setString(_userToken, token);
  }

  String getUserToken() {
    return _preferences.getString(_userToken) ?? '';
  }

  void logOut() {
    _preferences.setString(_userId, '');
  }
}
