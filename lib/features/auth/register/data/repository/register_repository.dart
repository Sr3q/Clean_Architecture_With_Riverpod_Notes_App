import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/mixin/dio_exception_mapper.dart';
import 'package:clean_note_app/features/auth/register/data/dto/request/register_request.dart';
import 'package:clean_note_app/features/auth/register/data/dto/response/register_response.dart';
import 'package:clean_note_app/features/auth/register/data/repository/iregister_repository.dart';
import 'package:clean_note_app/features/auth/register/data/source/remote/register_api.dart';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerRepositoryProvider =
    Provider.autoDispose<IRegisterRepository>((ref) {
  final registerApi = ref.watch(registerApiProvider);

  return RegisterRepository(registerApi);
});

final class RegisterRepository
    with DioExceptionMapper
    implements IRegisterRepository {
  final RegisterApi _api;

  RegisterRepository(this._api);

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await _api.register(request);

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
