import 'package:clean_note_app/core/data/remote/endpoint.dart';
import 'package:clean_note_app/core/data/remote/network_service.dart';
import 'package:clean_note_app/features/auth/login/data/dto/request/login_request.dart';
import 'package:clean_note_app/features/auth/login/data/dto/response/login_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginApiProvider = Provider.autoDispose<LoginApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return LoginApi(dio);
});

class LoginApi {
  final Dio _dio;

  LoginApi(this._dio);

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post(EndPoint.login, data: request.toJson());

      return LoginResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
