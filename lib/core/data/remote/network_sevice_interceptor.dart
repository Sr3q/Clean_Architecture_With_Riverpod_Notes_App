import 'package:clean_note_app/core/data/local/secure_storage/isecure_storage.dart';
import 'package:clean_note_app/core/data/local/secure_storage/secure_storage.dart';
import 'package:clean_note_app/core/data/local/storage_const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceInterceptorProvider =
    Provider<NetworkServiceInterceptor>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);

  return NetworkServiceInterceptor(secureStorage);
});

final class NetworkServiceInterceptor extends InterceptorsWrapper {
  final ISecureStorage _secureStorage;

  NetworkServiceInterceptor(this._secureStorage);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _secureStorage.getSecureData(tokenKey);

    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    super.onRequest(options, handler);
  }
}
