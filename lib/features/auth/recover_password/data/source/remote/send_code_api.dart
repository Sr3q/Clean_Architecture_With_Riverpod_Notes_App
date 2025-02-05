import 'package:clean_note_app/core/data/remote/endpoint.dart';
import 'package:clean_note_app/core/data/remote/network_service.dart';
import 'package:clean_note_app/features/auth/recover_password/data/dto/request/send_code_request.dart';
import 'package:clean_note_app/features/auth/recover_password/data/dto/response/send_code_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sendCodeApiProvider = Provider.autoDispose<SendCodeApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return SendCodeApi(dio);
});

class SendCodeApi {
  final Dio _dio;

  SendCodeApi(this._dio);

  Future<SendCodeResponse> sendCode(SendCodeRequest sendCodeRequest) async {
    try {
      final response = await _dio.post(EndPoint.recoverPassword,
          data: sendCodeRequest.toJson());

      return SendCodeResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
