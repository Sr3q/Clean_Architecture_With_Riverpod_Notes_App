import 'package:clean_note_app/features/auth/common_auth/presentation/provider/auth_provider.dart';
import 'package:clean_note_app/features/auth/email_verification/application/services/email_verification_service.dart';
import 'package:clean_note_app/features/auth/email_verification/data/dto/request/email_verification_request.dart';
import 'package:clean_note_app/features/auth/email_verification/presentation/state/email_verification_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailVerificationProvider =
    AutoDisposeNotifierProvider<EmailVerificationProvider, EmailVerificationState>(
        EmailVerificationProvider.new);

class EmailVerificationProvider extends AutoDisposeNotifier<EmailVerificationState> {
  @override
  EmailVerificationState build() {
    return EmailVerificationState();
  }

  Future<void> emailVerification() async {
    try {
      state = state.copyWith(
        isLoading: true,
        errorMessage: null,
        isEmailVerificationSuccess: false,
      );

      final request = EmailVerificationRequest(state.otp);

      final result = await ref
          .read(emailVerificationServiceProvider)
          .emailVerification(request);

      result.when(
        (success) async {
          await ref.read(authProvider.notifier).updateUserState();

          state = state.copyWith(
            isLoading: false,
            isEmailVerificationSuccess: true,
          );
        },
        (failure) {
          state = state.copyWith(
            isLoading: false,
            errorMessage: failure.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void setOtp(String otp) {
    state = state.copyWith(otp: otp);
  }
}
