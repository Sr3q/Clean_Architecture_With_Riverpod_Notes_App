abstract interface class ISharedPreferences {
  Future<bool> setData(String key, String value);
  String? getData(String key);
  Future<bool> removeData(String key);
}
