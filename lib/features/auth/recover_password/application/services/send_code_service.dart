import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/features/auth/recover_password/application/services/isend_code_service.dart';
import 'package:clean_note_app/features/auth/recover_password/data/dto/request/send_code_request.dart';
import 'package:clean_note_app/features/auth/recover_password/data/repository/isned_code_repository.dart';
import 'package:clean_note_app/features/auth/recover_password/data/repository/send_code_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final sendCodeServiceProvider = Provider.autoDispose<IsendCodeService>((ref) {
  final sendCodeRepository = ref.watch(sendCodeRepositoryProvider);

  return SendCodeService(sendCodeRepository);
});

final class SendCodeService implements IsendCodeService {
  final IsnedCodeRepository _snedCodeRepository;

  SendCodeService(this._snedCodeRepository);

  @override
  Future<Result<bool, Failure>> sendCode(
      SendCodeRequest sendCodeRequest) async {
    try {
      await _snedCodeRepository.sendCode(sendCodeRequest);

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
