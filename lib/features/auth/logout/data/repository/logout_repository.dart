import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/mixin/dio_exception_mapper.dart';
import 'package:clean_note_app/features/auth/logout/data/repository/ilogout_repository.dart';
import 'package:clean_note_app/features/auth/logout/data/source/remote/logout_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final logoutRepositoryProvider = Provider.autoDispose<IlogoutRepository>((ref) {
  final logoutApi = ref.watch(logoutApiProvider);

  return LogoutRepository(logoutApi); 
});

final class LogoutRepository
    with DioExceptionMapper
    implements IlogoutRepository {
  final LogoutApi _logoutApi;

  LogoutRepository(this._logoutApi);

  @override
  Future<void> logout() async {
    try {
      await _logoutApi.logout();
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
