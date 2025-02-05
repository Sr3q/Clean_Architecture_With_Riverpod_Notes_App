import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/features/auth/recover_password/data/dto/request/code_verification_request.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class IcodeVerificationService {
  Future<Result<bool, Failure>> codeVerification(
      CodeVerificationRequest codeVerificationRequest);
}
