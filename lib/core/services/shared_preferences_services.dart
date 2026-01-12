import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  // GETTERS
  bool getBool(String key, {bool defaultValue = false}) =>
      _prefs.getBool(key) ?? defaultValue;
  String getString(String key, {String defaultValue = ''}) =>
      _prefs.getString(key) ?? defaultValue;

  // SETTERS
  Future<void> setBool(String key, bool value) async =>
      await _prefs.setBool(key, value);
  Future<void> setString(String key, String value) async =>
      await _prefs.setString(key, value);

  // DELETE
  Future<void> remove(String key) async => await _prefs.remove(key);
}
