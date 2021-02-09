import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<dynamic> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.get(key);
  }

  Future<bool> save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();

    //Verify Data Type
    if (value is int) {
      prefs.setInt(key, value);
      return true;
    } else if (value is String) {
      prefs.setString(key, value);
      return true;
    } else if (value is bool) {
      prefs.setBool(key, value);
      return true;
    } else {
      print("Invalid Type");
      return true;
    }
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<bool> checkKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
