import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/features/auth/common_auth/application/model/user_model.dart';
import 'package:clean_note_app/features/auth/common_auth/application/services/iauth_state_service.dart';
import 'package:clean_note_app/features/auth/common_auth/data/repository/auth_state_repository.dart';
import 'package:clean_note_app/features/auth/common_auth/data/repository/iauth_state_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateServiceProvider = Provider.autoDispose<IauthStateService>((ref) {
  final authStateRepository = ref.watch(authStateRepositoryProvider);
  // print("authserviceprovider");

  return AuthStateService(authStateRepository);
});

final class AuthStateService implements IauthStateService {
  final IAuthStateRepository _authStateRepository;

  AuthStateService(this._authStateRepository);

  @override
  UserModel? getAuthState() {
    try {
      return _authStateRepository.getAuthState();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> removeAuthState() async {
    try {
      return await _authStateRepository.removeAuthState();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> setAuthState(String? token, UserModel user) async {
    try {
      return await _authStateRepository.setAuthState(token, user);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String?> getToken() async {
    return await _authStateRepository.getToken();
  }

  @override
  Future<bool> checkToken() async {
    try {
      return await _authStateRepository.checkToken();
    } catch (e) {
      return false;
    }
  }
}
