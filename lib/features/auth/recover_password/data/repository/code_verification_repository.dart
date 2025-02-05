import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/mixin/dio_exception_mapper.dart';
import 'package:clean_note_app/features/auth/recover_password/data/dto/request/code_verification_request.dart';
import 'package:clean_note_app/features/auth/recover_password/data/dto/response/code_verification_response.dart';
import 'package:clean_note_app/features/auth/recover_password/data/repository/icode_verification_repository.dart';
import 'package:clean_note_app/features/auth/recover_password/data/source/remote/code_verification_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final codeVerificationRepositoryProvider = Provider.autoDispose<IcodeVerificationRepository>((ref) {
  final codeVerificationApi = ref.watch(codeVerificationApiProvider);

  return CodeVerificationRepository(codeVerificationApi);
});

final class CodeVerificationRepository
    with DioExceptionMapper
    implements IcodeVerificationRepository {
  final CodeVerificationApi _codeVerificationApi;

  CodeVerificationRepository(this._codeVerificationApi);

  @override
  Future<CodeVerificationResponse> codeVerification(
      CodeVerificationRequest codeVerificationRequest) async {
    try {
      final response =
          await _codeVerificationApi.codeVerification(codeVerificationRequest);

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
