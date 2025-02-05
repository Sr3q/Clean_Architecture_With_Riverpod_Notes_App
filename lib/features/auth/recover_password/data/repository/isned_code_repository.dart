import 'package:clean_note_app/features/auth/recover_password/data/dto/request/send_code_request.dart';
import 'package:clean_note_app/features/auth/recover_password/data/dto/response/send_code_response.dart';

abstract interface class IsnedCodeRepository {
  Future<SendCodeResponse> sendCode(SendCodeRequest sendCodeRequest);
}
