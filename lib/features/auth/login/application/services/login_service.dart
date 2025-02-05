import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/features/auth/login/application/models/user_model.dart';
import 'package:clean_note_app/features/auth/login/application/services/ilogin_service.dart';
import 'package:clean_note_app/features/auth/login/data/dto/request/login_request.dart';
import 'package:clean_note_app/features/auth/login/data/dto/response/login_response.dart';
import 'package:clean_note_app/features/auth/login/data/repository/ilogin_repository.dart';
import 'package:clean_note_app/features/auth/login/data/repository/login_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final loginServiceProvider = Provider.autoDispose<ILoginService>((ref) {
  final loginRepository = ref.watch(loginRepositoryProvider);

  return LoginService(loginRepository);
});

final class LoginService implements ILoginService {
  final ILoginRepository _loginRepository;

  LoginService(this._loginRepository);

  @override
  Future<Result<UserModel, Failure>> login(LoginRequest request) async {
    try {
      final response = await _loginRepository.login(request);

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

  UserModel _mapLoginResponseToUserModel(LoginResponse response) {
    return UserModel(
      email: response.data.user.email,
      name: response.data.user.name,
      emailVerifiedAt: response.data.user.emailVerifiedAt,
      token: response.data.token,
    );
  }
}
