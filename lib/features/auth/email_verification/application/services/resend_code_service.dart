import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/features/auth/email_verification/application/services/iresend_code_service.dart';
import 'package:clean_note_app/features/auth/email_verification/data/repository/iresned_code_repository.dart';
import 'package:clean_note_app/features/auth/email_verification/data/repository/resend_code_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final resendCodeServiceProvider = Provider<IResendCodeService>((ref) {
  final resendCodeRepository = ref.watch(resendCodeRepositoryProvider);

  return ResendCodeService(resendCodeRepository);
});

final class ResendCodeService implements IResendCodeService {
  final IResendCodeRepository _resendCodeRepository;

  ResendCodeService(this._resendCodeRepository);

  @override
  Future<Result<bool, Failure>> resendCode() async {
    try {
      await _resendCodeRepository.resendCode();

      return Success(true);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
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
