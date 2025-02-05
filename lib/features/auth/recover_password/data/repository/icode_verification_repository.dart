import 'package:clean_note_app/features/auth/recover_password/data/dto/request/code_verification_request.dart';
import 'package:clean_note_app/features/auth/recover_password/data/dto/response/code_verification_response.dart';

abstract interface class IcodeVerificationRepository {
  Future<CodeVerificationResponse> codeVerification(CodeVerificationRequest codeVerificationRequest);
}