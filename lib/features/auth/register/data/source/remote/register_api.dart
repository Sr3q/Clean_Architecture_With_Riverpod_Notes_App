import 'package:clean_note_app/core/data/remote/endpoint.dart';
import 'package:clean_note_app/core/data/remote/network_service.dart';
import 'package:clean_note_app/features/auth/register/data/dto/request/register_request.dart';
import 'package:clean_note_app/features/auth/register/data/dto/response/register_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerApiProvider = Provider.autoDispose<RegisterApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return RegisterApi(dio);
});

class RegisterApi {
  final Dio _dio;

  RegisterApi(this._dio);

  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response =
          await _dio.post(EndPoint.register, data: request.toJson());

      return RegisterResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
