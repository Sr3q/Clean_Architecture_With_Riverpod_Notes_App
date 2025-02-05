import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/mixin/dio_exception_mapper.dart';
import 'package:clean_note_app/features/auth/email_verification/data/dto/response/resend_code_response.dart';
import 'package:clean_note_app/features/auth/email_verification/data/repository/iresned_code_repository.dart';
import 'package:clean_note_app/features/auth/email_verification/data/source/remote/resend_code_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resendCodeRepositoryProvider = Provider.autoDispose<IResendCodeRepository>((ref) {
  final resendCodeApi = ref.watch(resendCodeApiProvider);

  return ResendCodeRepository(resendCodeApi);
});

final class ResendCodeRepository
    with DioExceptionMapper
    implements IResendCodeRepository {
  final ResendCodeApi _resendCodeApi;

  ResendCodeRepository(this._resendCodeApi);

  @override
  Future<ResendCodeResponse> resendCode() async {
    try {
      final response = await _resendCodeApi.resendCode();

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
