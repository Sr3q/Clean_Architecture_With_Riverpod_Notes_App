import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/mixin/dio_exception_mapper.dart';
import 'package:clean_note_app/features/auth/recover_password/data/dto/request/send_code_request.dart';
import 'package:clean_note_app/features/auth/recover_password/data/dto/response/send_code_response.dart';
import 'package:clean_note_app/features/auth/recover_password/data/repository/isned_code_repository.dart';
import 'package:clean_note_app/features/auth/recover_password/data/source/remote/send_code_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sendCodeRepositoryProvider = Provider.autoDispose<IsnedCodeRepository>((ref) {
  final sendCodeApi = ref.watch(sendCodeApiProvider);

  return SendCodeRepository(sendCodeApi);
});

final class SendCodeRepository
    with DioExceptionMapper
    implements IsnedCodeRepository {
  final SendCodeApi _sendCodeApi;

  SendCodeRepository(this._sendCodeApi);

  @override
  Future<SendCodeResponse> sendCode(SendCodeRequest sendCodeRequest)async {
    try {
      final response = await _sendCodeApi.sendCode(sendCodeRequest);

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
