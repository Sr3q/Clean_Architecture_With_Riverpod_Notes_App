import 'package:clean_note_app/features/auth/register/data/dto/request/register_request.dart';
import 'package:clean_note_app/features/auth/register/data/dto/response/register_response.dart';

abstract interface class IRegisterRepository {
  Future<RegisterResponse> register(RegisterRequest request);
}