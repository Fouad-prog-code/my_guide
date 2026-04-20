import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static Future<bool> setData({
    required String key,
    required String value,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(key, value);
  }

  static Future<String?> getData({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key);
  }

  static Future<bool> removeData({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.remove(key);
  }
}
