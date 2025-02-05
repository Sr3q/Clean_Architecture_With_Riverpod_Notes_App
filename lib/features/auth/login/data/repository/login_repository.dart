import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/mixin/dio_exception_mapper.dart';
import 'package:clean_note_app/features/auth/login/data/dto/request/login_request.dart';
import 'package:clean_note_app/features/auth/login/data/dto/response/login_response.dart';
import 'package:clean_note_app/features/auth/login/data/repository/ilogin_repository.dart';
import 'package:clean_note_app/features/auth/login/data/source/remote/login_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginRepositoryProvider = Provider.autoDispose<ILoginRepository>((ref) {
  final loginApi = ref.watch(loginApiProvider);

  return LoginRepository(loginApi);
});

final class LoginRepository
    with DioExceptionMapper
    implements ILoginRepository {
  final LoginApi _loginApi;

  LoginRepository(this._loginApi);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _loginApi.login(request);
      
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
