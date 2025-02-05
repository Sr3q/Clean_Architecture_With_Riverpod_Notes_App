import 'package:clean_note_app/core/data/remote/endpoint.dart';
import 'package:clean_note_app/core/data/remote/network_service.dart';
import 'package:clean_note_app/features/auth/email_verification/data/dto/request/email_verification_request.dart';
import 'package:clean_note_app/features/auth/email_verification/data/dto/response/email_verification_response.dart';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailVerificationApiProvider = Provider.autoDispose<EmailVerificationApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return EmailVerificationApi(dio);
});

class EmailVerificationApi {
  final Dio _dio;

  EmailVerificationApi(this._dio);

  Future<EmailVerificationResponse> emailVerification(EmailVerificationRequest request)async{
    try{
      final response = await _dio.post(EndPoint.emailVerification, data: request.toJson());

      return EmailVerificationResponse.fromJson(response.data);
    }catch(e){
      rethrow;
    }
  }
}