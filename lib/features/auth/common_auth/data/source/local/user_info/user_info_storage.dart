import 'dart:convert';

import 'package:clean_note_app/core/data/local/shared_preferences/ishared_preferences.dart';
import 'package:clean_note_app/core/data/local/shared_preferences/shared_preferences_impl.dart';
import 'package:clean_note_app/core/data/local/storage_const.dart';
import 'package:clean_note_app/features/auth/common_auth/application/model/user_model.dart';
import 'package:clean_note_app/features/auth/common_auth/data/source/local/user_info/iuser_info_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userInfoStorageProvider = Provider<IuserInfoStorage>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);

  return UserInfoStorage(sharedPreferences);
});

final class UserInfoStorage implements IuserInfoStorage {
  final ISharedPreferences _sharedPreferences;

  UserInfoStorage(this._sharedPreferences);

  @override
  UserModel? getUser() {
    final user = _sharedPreferences.getData(userKey);

    return user == null ? null : UserModel.fromJson(jsonDecode(user));
  }

  @override
  Future<bool> setUser(UserModel user) async {
    final userData = jsonEncode(user.toJson());

    return await _sharedPreferences.setData(userKey, userData);
  }

  @override
  Future<bool> removeUser() async {
    return await _sharedPreferences.removeData(userKey);
  }
}
