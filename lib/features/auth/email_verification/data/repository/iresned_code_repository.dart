import 'package:clean_note_app/features/auth/email_verification/data/dto/response/resend_code_response.dart';

abstract interface class IResendCodeRepository {
  Future<ResendCodeResponse> resendCode();
}