abstract interface class ITokenStorage {
  Future<void> setToken(String token);
  Future<String?> getToken();
  Future<void> removeToken();
}
