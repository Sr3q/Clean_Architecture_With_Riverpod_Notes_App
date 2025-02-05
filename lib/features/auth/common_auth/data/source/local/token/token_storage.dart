import 'package:clean_note_app/core/data/local/secure_storage/isecure_storage.dart';
import 'package:clean_note_app/core/data/local/secure_storage/secure_storage.dart';
import 'package:clean_note_app/core/data/local/storage_const.dart';
import 'package:clean_note_app/features/auth/common_auth/data/source/local/token/itoken_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tokenStorageProvider = Provider.autoDispose<ITokenStorage>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return TokenStorage(secureStorage);
});

final class TokenStorage implements ITokenStorage {
  final ISecureStorage _secureStorage;

  TokenStorage(this._secureStorage);

  @override
  Future<void> setToken(String token) async {
    await _secureStorage.setSecureData(tokenKey, token);
  }
  
  @override
  Future<void> removeToken() async {
    await _secureStorage.removeSecureData(tokenKey);
  }
  
  @override
  Future<String?> getToken() async {
    return await _secureStorage.getSecureData(tokenKey);
  }
}
