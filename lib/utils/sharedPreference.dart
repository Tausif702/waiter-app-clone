import 'package:shared_preferences/shared_preferences.dart';

class PrefKeys {
  static const String isLogin = "isLogin";
  static const String userToken = "userToken";
  static const String userName = "userName";
}

class SharedPref {
  static Future<bool> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  static Future<bool> setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future<bool> getLogin() async {
    return getBool(PrefKeys.isLogin);
  }
}
