import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/features/auth/recover_password/application/services/icode_verification_service.dart';
import 'package:clean_note_app/features/auth/recover_password/data/dto/request/code_verification_request.dart';
import 'package:clean_note_app/features/auth/recover_password/data/repository/code_verification_repository.dart';
import 'package:clean_note_app/features/auth/recover_password/data/repository/icode_verification_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final codeVerificationServiceProvider = Provider.autoDispose<IcodeVerificationService>((ref) {
  final codeVerificationRepository = ref.watch(codeVerificationRepositoryProvider);

  return CodeVerificationService(codeVerificationRepository);
});

final class CodeVerificationService implements IcodeVerificationService {
  final IcodeVerificationRepository _codeVerificationRepository;

  CodeVerificationService(this._codeVerificationRepository);

  @override
  Future<Result<bool, Failure>> codeVerification(
      CodeVerificationRequest codeVerificationRequest) async {
    try {
      await _codeVerificationRepository
          .codeVerification(codeVerificationRequest);

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
