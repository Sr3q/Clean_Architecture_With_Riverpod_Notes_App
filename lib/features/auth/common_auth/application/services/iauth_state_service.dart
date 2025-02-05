import 'package:clean_note_app/features/auth/common_auth/application/model/user_model.dart';

abstract interface class IauthStateService {
  Future<bool> setAuthState(String? token, UserModel user);
  Future<bool> removeAuthState();
  UserModel? getAuthState();
  Future<String?> getToken();
}
