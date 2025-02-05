import 'package:clean_note_app/features/auth/common_auth/presentation/provider/auth_provider.dart';
import 'package:clean_note_app/features/auth/login/application/services/login_service.dart';
import 'package:clean_note_app/features/auth/login/data/dto/request/login_request.dart';
import 'package:clean_note_app/features/auth/login/presentation/state/login_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider =
    AutoDisposeNotifierProvider<LoginProvider, LoginState>(LoginProvider.new);

class LoginProvider extends AutoDisposeNotifier<LoginState> {
  @override
  LoginState build() {
    return LoginState();
  }

  Future<void> login() async {
    try {
      state = state.copyWith(
          isLoading: true, errorMessage: null, isLoginSuccess: false);

      final request = LoginRequest(
        email: state.loginForm["email"],
        password: state.loginForm["password"],
      );

      final result = await ref.read(loginServiceProvider).login(request);

      result.when(
        (success) async{
          ref.invalidate(authProvider);
          await ref
              .read(authProvider.notifier)
              .setAuthState(success.token, success.tojson());

          state = state.copyWith(isLoading: false, isLoginSuccess: true);
        },
        (failuer) {
          state =
              state.copyWith(isLoading: false, errorMessage: failuer.message);
        },
      );
    } catch (e) {
      state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(loginForm: formData);
  }
}
