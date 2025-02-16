import 'package:clean_note_app/features/auth/common_auth/application/model/user_model.dart';
import 'package:clean_note_app/features/auth/common_auth/application/services/auth_state_service.dart';
import 'package:clean_note_app/features/auth/common_auth/presentation/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider =
    NotifierProvider<AuthProvider, AuthState>(AuthProvider.new);

class AuthProvider extends Notifier<AuthState> {
  @override
  AuthState build() {
    return AuthState();
  }

  Future<void> getAuthState() async {
    final user = ref.read(authStateServiceProvider).getAuthState();

    if (user != null) {
      final result = await ref.read(authStateServiceProvider).checkToken();

      if (result) {
        state = state.copyWith(isAuthuthenticated: true, user: user);
      } else {
        removeAuthState();
      }
    }
  }

  Future<void> setAuthState(String token, Map<String, dynamic> data) async {
    final user = UserModel.fromJson(data);

    await ref.read(authStateServiceProvider).setAuthState(token, user);

    state = state.copyWith(isAuthuthenticated: true, user: user);
  }

  Future<void> removeAuthState() async {
    await ref.read(authStateServiceProvider).removeAuthState();

    state = state.copyWith(isAuthuthenticated: false, user: null);
  }

  Future<void> updateUserState() async {
    final user =
        state.user!.copyWith(emailVerifiedAt: DateTime.now().toString());

    await ref.read(authStateServiceProvider).setAuthState(null, user);

    state = state.copyWith(user: user);
  }

  Future<String?> getToken() async {
    return await ref.read(authStateServiceProvider).getToken();
  }
}
