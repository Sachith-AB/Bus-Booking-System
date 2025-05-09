import 'package:shared_preferences/shared_preferences.dart';

class SharedAuthUser {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> saveAuthUser(List<String> value) async {
    await _prefs?.setStringList('user', value);
  }

  static List<String>? getAuthUser() {
    return _prefs?.getStringList('user');
  }

  static Future<void> clearAuthUser() async {
    await _prefs?.remove('user');
  }
}
