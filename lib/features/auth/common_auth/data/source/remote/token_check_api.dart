import 'package:clean_note_app/core/data/remote/endpoint.dart';
import 'package:clean_note_app/core/data/remote/network_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tokenCheckApiProvider = Provider.autoDispose<TokenCheckApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return TokenCheckApi(dio);
});

class TokenCheckApi {
  final Dio _dio;

  TokenCheckApi(this._dio);

  Future<bool> checkToken() async {
    try {
      await _dio.get(EndPoint.tokenCheck);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
