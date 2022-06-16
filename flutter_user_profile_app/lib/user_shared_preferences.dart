import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static SharedPreferences? _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setValue(bool value) async {
    await _preferences?.setBool("Theme", value);
  }

  static bool? getValue() {
    return _preferences?.getBool("Theme");
  }
}
