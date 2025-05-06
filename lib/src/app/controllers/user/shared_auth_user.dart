import 'package:shared_preferences/shared_preferences.dart';

class SharedAuthUser {
  static late final SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void saveAuthUser(value) {
    prefs.setStringList('user', value);
  }
}