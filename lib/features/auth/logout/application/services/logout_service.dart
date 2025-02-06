import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/features/auth/logout/application/services/ilogout_service.dart';
import 'package:clean_note_app/features/auth/logout/data/repository/ilogout_repository.dart';
import 'package:clean_note_app/features/auth/logout/data/repository/logout_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final logoutServiceProvider = Provider.autoDispose<IlogoutService>((ref) {
  final logoutRepository = ref.watch(logoutRepositoryProvider);

  return LogoutService(logoutRepository);
});

final class LogoutService implements IlogoutService {
  final IlogoutRepository _logoutRepository;

  const LogoutService(this._logoutRepository);

  @override
  Future<Result<bool, Failure>> logout() async {
    try {
      await _logoutRepository.logout();

      return Success(true);
    } on Failure catch (e) {
      return Error(e);
    }catch (e, s) {
      return Error(
        Failure(
          message: e.toString(),
          exception: e as Exception,
          stackTrace: s,
        ),
      );
    }
  }
}
