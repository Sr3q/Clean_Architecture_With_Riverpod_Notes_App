import 'package:clean_note_app/features/auth/login/data/dto/request/login_request.dart';
import 'package:clean_note_app/features/auth/login/data/dto/response/login_response.dart';

abstract interface class ILoginRepository {
  Future<LoginResponse> login(LoginRequest request);
}