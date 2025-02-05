import 'package:clean_note_app/features/auth/common_auth/presentation/provider/auth_provider.dart';
import 'package:clean_note_app/features/auth/register/application/services/register_service.dart';
import 'package:clean_note_app/features/auth/register/data/dto/request/register_request.dart';
import 'package:clean_note_app/features/auth/register/presentation/state/register_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerProvider =
    AutoDisposeNotifierProvider<RegisterProvider, RegisterState>(RegisterProvider.new);

class RegisterProvider extends AutoDisposeNotifier<RegisterState> {
  @override
  RegisterState build() {
    return RegisterState();
  }

  Future<void> register() async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);

      final request = RegisterRequest(
        email: state.registerForm["email"],
        password: state.registerForm["password"],
        name: state.registerForm["name"],
      );

      final result = await ref.read(registerServiceProvider).register(request);

      result.when(
        (success) async{
          ref.invalidate(authProvider);
          await ref.read(authProvider.notifier)
              .setAuthState(success.token, success.tojson());
              
          state = state.copyWith(isLoading: false, isRegisterSuccess: true);
        },
        (failure) {
          state =
              state.copyWith(isLoading: false, errorMessage: failure.message);
        },
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(registerForm: formData);
  }
}
