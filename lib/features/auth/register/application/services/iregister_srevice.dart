import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/features/auth/register/application/models/user_model.dart';
import 'package:clean_note_app/features/auth/register/data/dto/request/register_request.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class IRegisterService {
  Future<Result<UserModel, Failure>> register(RegisterRequest request);
}
