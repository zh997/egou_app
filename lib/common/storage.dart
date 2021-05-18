import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static SharedPreferences _pref;
  static Future<SharedPreferences> getInstance() async{
    if (_pref == null) {
      _pref = await SharedPreferences.getInstance();
      return _pref;
    } else {
      return _pref;
    }
  }

  static Future<bool> setInt(String key, int value) => _pref.setInt(key, value);
  static Future<bool> setBool(String key, bool value) => _pref.setBool(key, value);
  static Future<bool> setDouble(String key, double value) => _pref.setDouble(key, value);
  static Future<bool> setString(String key, String value) => _pref.setString(key, value);
  static Future<bool> setStringList(String key, List<String> value) => _pref.setStringList(key, value);

  static int getInt(String key) => _pref.getInt(key);
  static bool getBool(String key) => _pref.getBool(key);
  static double getDouble(String key) => _pref.getDouble(key);
  static String getString(String key) => _pref.getString(key);
  static List<String> getStringList(String key) => _pref.getStringList(key);

  static remove(String key) => _pref.remove(key);

}
