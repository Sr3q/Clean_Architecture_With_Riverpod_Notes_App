import 'package:clean_note_app/features/auth/email_verification/data/dto/request/email_verification_request.dart';
import 'package:clean_note_app/features/auth/email_verification/data/dto/response/email_verification_response.dart';

abstract interface class IEmailVerificationRepository {

  Future<EmailVerificationResponse> emailVerification(EmailVerificationRequest request);
}