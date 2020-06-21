abstract class BasePrefs {
  Future<void> initialise();

  //Getters
  bool getBool(String key);

  int getInt(String key);

  double getDouble(String key);

  String getString(String key);

  List<String> getStringList(String key);

  //Setters
  void setBool(String key, bool value);

  void setInt(String key, int value);

  void setDouble(String key, double value);

  void setString(String key, String value);

  void setStringList(String key, List<String> value);

  //MISC
  Future<Map<String, dynamic>> getMap();

  Future<void> reload();

  void remove(String key);

  void clear();
}
