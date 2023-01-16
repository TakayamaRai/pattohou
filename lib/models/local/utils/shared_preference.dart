import 'package:shared_preferences/shared_preferences.dart';

class SP {
  static SharedPreferences? prefs;

  static Future<void> instance() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void setString(key, value) {
    prefs?.setString(key, value);
  }

  static String getString(key) {
    return prefs?.getString(key) ?? "";
  }

  static void setBool(key, value) {
    prefs?.setBool(key, value);
  }

  static bool? getBool(key) {
    return prefs?.getBool(key);
  }
}
