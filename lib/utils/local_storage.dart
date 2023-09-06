// ignore_for_file: body_might_complete_normally_nullable

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? prefs;

  static const String aadhar = 'aadhar';
  static const String checkid = 'checkid';
  static const String userName = 'username';
  static const List<String> _selectedItems = [];

  static const String email = 'email';
  static const String phone = 'phone';
  static const String profile = 'profile_pic';
  static const String language = 'selected_language';
  static const bool login = true;

  static Future initSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  static clearPreference() async {
    await prefs!.clear();
  }

  static void setProfile(String newProfile) {
    prefs!.setString(profile, newProfile);
  }

  static String? getProfile() {
    return prefs!.getString(profile);
  }

  static String? setLanguage(String newlanguage) {
    prefs!.setString(language, newlanguage);
  }

  static String? getLanguage() {
    return prefs!.getString(language);
  }

  static String? setEmptyList(String NewEmptyList) {
    prefs!.setString(_selectedItems.toString(), NewEmptyList);
  }

  static String? getEmptyList() {
    return prefs!.getString(_selectedItems.toString());
  }

  static void setCheckId(String newCheckId) {
    prefs!.setString(checkid, newCheckId);
  }

  static String? getCheckId() {
    return prefs!.getString(checkid);
  }

  static void setUserName(String userNameNew) {
    prefs!.setString(userName, userNameNew);
  }

  static String? getUserName() {
    return prefs!.getString(userName);
  }

  static void setEmail(String emailNew) {
    prefs!.setString(email, emailNew);
  }

  static String? getEmail() {
    return prefs!.getString(email);
  }

  static void setPhone(String phoneNew) {
    prefs!.setString(phone, phoneNew);
  }

  static String? getPhone() {
    return prefs!.getString(phone);
  }

  static void setLogin(String newLogin) {
    prefs!.setString(login as String, newLogin);
  }

  static String? getLogin() {
    return prefs!.getString(login as String);
  }

  static bool? removeRmpId() {
    prefs!.remove(userName);
    return null;
  }
}
