import 'package:clean_note_app/features/auth/recover_password/application/services/code_verification_service.dart';
import 'package:clean_note_app/features/auth/recover_password/data/dto/request/code_verification_request.dart';
import 'package:clean_note_app/features/auth/recover_password/presentation/state/code_verification_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final codeVerificationProvider = NotifierProvider<
    CodeVerificationProvider,
    CodeVerificationState>(CodeVerificationProvider.new);

class CodeVerificationProvider
    extends Notifier<CodeVerificationState> {
  @override
  CodeVerificationState build() {
    return CodeVerificationState();
  }

  Future<void> verifyCode() async {
    try {
      state = state.copyWith(
          isLoading: true, errorMessage: null, isPasswordChangeSuccess: false);

      final requset =
          CodeVerificationRequest.fromJson(state.passwordChangeForm);

      final result = await ref
          .read(codeVerificationServiceProvider)
          .codeVerification(requset);

      result.when(
        (success) {
          state =
              state.copyWith(isLoading: false, isPasswordChangeSuccess: true);
        },
        (failure) {
          state = state.copyWith(
            isLoading: false,
            errorMessage: failure.message,
            isPasswordChangeSuccess: false,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        isPasswordChangeSuccess: false,
      );
    }
  }

  void setForm(Map<String, dynamic> formData) {
    formData["email"] = state.passwordChangeForm["email"];

    state = state.copyWith(passwordChangeForm: formData);
  }

  void setEmail(String email) {
    state = state.copyWith(passwordChangeForm: {"email": email});
  }
}
