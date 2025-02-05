
abstract interface class ISecureStorage {
  
  Future<String?> getSecureData(String key);

  Future<void> setSecureData(String key, String value);

  Future<void> removeSecureData(String key);
}