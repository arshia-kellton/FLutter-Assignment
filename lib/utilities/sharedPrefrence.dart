import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {
  // set String values
  static setSharedPreferences(String value, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  // get String value
  static Future<String?> getSharedPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString(key);
    return stringValue;
  }

  // set int value
  static setSharedPreferencesInt(int value, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  static Future<int?> getSharedPreferencesInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? value = prefs.getInt(key);
    return value;
  }

  static setLoginStatus(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future<bool?> getLoginStatus(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool(key) != null ? prefs.getBool(key) : false;
    return value;
  }

  static setUsrname(String key, String  value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String?> getUsrname(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key) != null ? prefs.getString(key) : "false";
    return value;
  }
}