import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/features/auth/register/application/models/user_model.dart';
import 'package:clean_note_app/features/auth/register/application/services/iregister_srevice.dart';
import 'package:clean_note_app/features/auth/register/data/dto/request/register_request.dart';
import 'package:clean_note_app/features/auth/register/data/dto/response/register_response.dart';
import 'package:clean_note_app/features/auth/register/data/repository/iregister_repository.dart';
import 'package:clean_note_app/features/auth/register/data/repository/register_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final registerServiceProvider = Provider.autoDispose<IRegisterService>((ref) {
  final repository = ref.watch(registerRepositoryProvider);

  return RegisterService(repository);
});

final class RegisterService implements IRegisterService {
  final IRegisterRepository _repository;

  RegisterService(this._repository);

  @override
  Future<Result<UserModel, Failure>> register(RegisterRequest request) async {
    try {
      final response = await _repository.register(request);

      final model = _mapLoginResponseToUserModel(response);

      return Success(model);
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

  UserModel _mapLoginResponseToUserModel(RegisterResponse response) {
    return UserModel(
      email: response.data.user.email,
      name: response.data.user.name,
      emailVerifiedAt: response.data.user.emailVerifiedAt,
      token: response.data.token,
    );
  }
}
