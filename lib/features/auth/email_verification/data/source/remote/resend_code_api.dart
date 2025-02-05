import 'package:clean_note_app/core/data/remote/endpoint.dart';
import 'package:clean_note_app/core/data/remote/network_service.dart';
import 'package:clean_note_app/features/auth/email_verification/data/dto/response/resend_code_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resendCodeApiProvider = Provider.autoDispose<ResendCodeApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return ResendCodeApi(dio);
});

class ResendCodeApi {
  final Dio _dio;

  ResendCodeApi(this._dio);

  Future<ResendCodeResponse> resendCode() async {
    try {
      final response = await _dio.get(EndPoint.reSendEmailVerification);

      return ResendCodeResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
