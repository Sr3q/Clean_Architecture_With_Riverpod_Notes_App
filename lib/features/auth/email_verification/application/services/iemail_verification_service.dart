import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/features/auth/email_verification/data/dto/request/email_verification_request.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class IEmailVerificationService{

  Future<Result<bool,Failure>> emailVerification(EmailVerificationRequest request);
}