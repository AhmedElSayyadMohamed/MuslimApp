import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    required dynamic value,
    required String key,
  }) {
    if (value is int) {
      return sharedPreferences!.setInt(key, value);
    }
    if (value is double) {
      return sharedPreferences!.setDouble(key, value);
    }
    if (value is String) {
      return sharedPreferences!.setString(key, value);
    }
    if (value is List<String>) {
      return sharedPreferences!.setStringList(key, value);
    }
    return sharedPreferences!.setBool(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> removeData({required key}) async {
    return await sharedPreferences!.remove(key);
  }
}
