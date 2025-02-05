import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/features/auth/recover_password/data/dto/request/send_code_request.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class IsendCodeService {
  Future<Result<bool, Failure>> sendCode(SendCodeRequest sendCodeRequest);
}
