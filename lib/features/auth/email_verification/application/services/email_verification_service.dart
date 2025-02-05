import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/features/auth/email_verification/application/services/iemail_verification_service.dart';
import 'package:clean_note_app/features/auth/email_verification/data/dto/request/email_verification_request.dart';
import 'package:clean_note_app/features/auth/email_verification/data/repository/email_verification_repository.dart';
import 'package:clean_note_app/features/auth/email_verification/data/repository/iemail_verification_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final emailVerificationServiceProvider = Provider.autoDispose<IEmailVerificationService>((ref) {
  final emailVerificationRepository = ref.watch(emailVerificationRepositoryProvider);

  return EmailVerificationService(emailVerificationRepository);
});

final class EmailVerificationService implements IEmailVerificationService {
  final IEmailVerificationRepository _emailVerificationRepository;

  EmailVerificationService(this._emailVerificationRepository);

  @override
  Future<Result<bool, Failure>> emailVerification(
      EmailVerificationRequest request) async {
    try {
      await _emailVerificationRepository.emailVerification(request);

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
