import 'package:clean_note_app/core/data/remote/endpoint.dart';
import 'package:clean_note_app/core/data/remote/network_service.dart';
import 'package:clean_note_app/features/auth/recover_password/data/dto/request/code_verification_request.dart';
import 'package:clean_note_app/features/auth/recover_password/data/dto/response/code_verification_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final codeVerificationApiProvider = Provider.autoDispose<CodeVerificationApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return CodeVerificationApi(dio);
});

class CodeVerificationApi {
  final Dio _dio;

  CodeVerificationApi(this._dio);

  Future<CodeVerificationResponse> codeVerification(CodeVerificationRequest codeVerificationRequest) async {
    try {
      final response = await _dio.post(EndPoint.recoverPasswordVerification, data: codeVerificationRequest.toJson());
      return CodeVerificationResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}