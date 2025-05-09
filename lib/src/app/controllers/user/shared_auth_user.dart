import 'package:shared_preferences/shared_preferences.dart';

class SharedAuthUser {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> saveAuthUser(List<String> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('authUser', userData);
  }

  static List<String>? getAuthUser() {
    return _prefs?.getStringList('authUser'); // Fix: Directly access _prefs
  }

  static Future<void> clearAuthUser() async {
    await _prefs?.remove('authUser'); // Fix: Correct key used
  }
}
