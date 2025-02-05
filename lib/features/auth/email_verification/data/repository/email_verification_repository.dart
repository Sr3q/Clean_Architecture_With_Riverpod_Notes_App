import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/mixin/dio_exception_mapper.dart';
import 'package:clean_note_app/features/auth/email_verification/data/dto/request/email_verification_request.dart';
import 'package:clean_note_app/features/auth/email_verification/data/dto/response/email_verification_response.dart';
import 'package:clean_note_app/features/auth/email_verification/data/repository/iemail_verification_repository.dart';
import 'package:clean_note_app/features/auth/email_verification/data/source/remote/email_verification_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailVerificationRepositoryProvider =
    Provider.autoDispose<IEmailVerificationRepository>((ref) {
  final emailVerificationApi = ref.watch(emailVerificationApiProvider);

  return EmailVerificationRepository(emailVerificationApi);
});

final class EmailVerificationRepository
    with DioExceptionMapper
    implements IEmailVerificationRepository {
  final EmailVerificationApi _emailVerificationApi;

  EmailVerificationRepository(this._emailVerificationApi);

  @override
  Future<EmailVerificationResponse> emailVerification(
      EmailVerificationRequest request) async {
    try {
      final response = await _emailVerificationApi.emailVerification(request);

      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw Failure(
        message: e.toString(),
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }
}
