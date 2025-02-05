import 'package:clean_note_app/features/auth/common_auth/application/model/user_model.dart';

abstract interface class IuserInfoStorage {
  Future<bool> setUser(UserModel user);
  UserModel? getUser();
  Future<bool> removeUser();
}
