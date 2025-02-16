import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/mixin/dio_exception_mapper.dart';
import 'package:clean_note_app/features/auth/common_auth/application/model/user_model.dart';
import 'package:clean_note_app/features/auth/common_auth/data/repository/iauth_state_repository.dart';
import 'package:clean_note_app/features/auth/common_auth/data/source/local/token/itoken_storage.dart';
import 'package:clean_note_app/features/auth/common_auth/data/source/local/token/token_storage.dart';
import 'package:clean_note_app/features/auth/common_auth/data/source/local/user_info/iuser_info_storage.dart';
import 'package:clean_note_app/features/auth/common_auth/data/source/local/user_info/user_info_storage.dart';
import 'package:clean_note_app/features/auth/common_auth/data/source/remote/token_check_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateRepositoryProvider =
    Provider.autoDispose<IAuthStateRepository>((ref) {
  final tokenStorage = ref.watch(tokenStorageProvider);
  final userInfoStorage = ref.watch(userInfoStorageProvider);
  final tokenCheckApi = ref.watch(tokenCheckApiProvider);

  return AuthStateRepository(
    tokenStorage,
    userInfoStorage,
    tokenCheckApi,
  );
});

final class AuthStateRepository
    with DioExceptionMapper
    implements IAuthStateRepository {
  final ITokenStorage _tokenStorage;
  final IuserInfoStorage _userInfoStorage;
  final TokenCheckApi _tokenCheckApi;

  AuthStateRepository(
    this._tokenStorage,
    this._userInfoStorage,
    this._tokenCheckApi,
  );

  @override
  UserModel? getAuthState() {
    try {
      return _userInfoStorage.getUser();
    } catch (e, s) {
      throw Failure(
        message: e.toString(),
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }

  @override
  Future<bool> removeAuthState() async {
    try {
      await _tokenStorage.removeToken();
      return await _userInfoStorage.removeUser();
    } catch (e, s) {
      throw Failure(
        message: e.toString(),
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }

  @override
  Future<bool> setAuthState(String? token, UserModel user) async {
    try {
      if (token != null) {
        await _tokenStorage.setToken(token);
      }
      return await _userInfoStorage.setUser(user);
    } catch (e, s) {
      throw Failure(
        message: e.toString(),
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      return await _tokenStorage.getToken();
    } catch (e, s) {
      throw Failure(
        message: e.toString(),
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }

  @override
  Future<bool> checkToken() async {
    try {
      return await _tokenCheckApi.checkToken();
    } catch (e) {
      rethrow;
    }
  }
}
