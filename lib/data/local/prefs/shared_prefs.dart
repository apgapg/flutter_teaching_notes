import 'package:flutter_teaching_notes/utils/log_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_prefs.dart';

class SharedPrefs implements BasePrefs {
  SharedPreferences _prefs;

  @override
  Future<void> initialise() async {
    logger.d("Initialising Shared Prefs...");
    _prefs = await SharedPreferences.getInstance();
    logger.d("Shared Prefs initialized");
  }

  @override
  bool getBool(String key) {
    return _prefs.getBool(key);
  }

  @override
  double getDouble(String key) {
    return _prefs.getDouble(key);
  }

  @override
  int getInt(String key) {
    return _prefs.getInt(key);
  }

  @override
  String getString(String key) {
    return _prefs.getString(key);
  }

  @override
  List<String> getStringList(String key) {
    return _prefs.getStringList(key);
  }

  @override
  void setBool(String key, bool value) {
    _prefs.setBool(key, value);
  }

  @override
  void setDouble(String key, double value) {
    _prefs.setDouble(key, value);
  }

  @override
  void setInt(String key, int value) {
    _prefs.setInt(key, value);
  }

  @override
  void setString(String key, String value) {
    _prefs.setString(key, value);
  }

  @override
  void setStringList(String key, List<String> value) {
    _prefs.setStringList(key, value);
  }

  @override
  void clear() {
    _prefs.clear();
  }

  @override
  void remove(String key) {
    _prefs.remove(key);
  }

  @override
  Future<void> reload() async {
    await _prefs.reload();
  }

  @override
  Future<Map<String, dynamic>> getMap() async {
    await Future.delayed(const Duration(milliseconds: 0));
    final map = <String, dynamic>{};
    _prefs.getKeys().forEach((e) {
      map.putIfAbsent(e, () => MapEntry(e, _prefs.get(e)));
    });
    return map;
  }
}
