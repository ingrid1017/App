import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const _keyFirstTime = 'isFirstTime';

  static Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyFirstTime) ?? true;
  }

  static Future<void> setNotFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyFirstTime, false);
  }
}
