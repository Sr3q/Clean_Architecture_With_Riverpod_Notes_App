import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/features/auth/login/application/models/user_model.dart';
import 'package:clean_note_app/features/auth/login/data/dto/request/login_request.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class ILoginService {
  Future<Result<UserModel, Failure>> login(LoginRequest request);
}
