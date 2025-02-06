import 'package:clean_note_app/core/data/remote/endpoint.dart';
import 'package:clean_note_app/core/data/remote/network_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final logoutApiProvider = Provider.autoDispose<LogoutApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return LogoutApi(dio);
});

class LogoutApi {
  final Dio _dio;

  LogoutApi(this._dio);

  Future<void> logout() async {
    try {
      await _dio.post(EndPoint.logout);
    } catch (e) {
      rethrow;
    }
  }
}
