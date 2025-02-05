import 'package:clean_note_app/features/auth/email_verification/application/services/resend_code_service.dart';
import 'package:clean_note_app/features/auth/email_verification/presentation/state/resend_code_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resendCodeProvider =
    AutoDisposeNotifierProvider<ResendCodeProvider, ResendCodeState>(
        ResendCodeProvider.new);

class ResendCodeProvider extends AutoDisposeNotifier<ResendCodeState> {
  @override
  ResendCodeState build() {
    return ResendCodeState();
  }

  Future<void> resendCode() async {
    try {
      state = state.copyWith(
          isLoading: true, errorMessage: null, isCodeResendSuccess: false);

      final result = await ref.read(resendCodeServiceProvider).resendCode();

      result.when(
        (success) {
          state = state.copyWith(isLoading: false, isCodeResendSuccess: true);
        },
        (failure) {
          state = state.copyWith(
              isLoading: false,
              errorMessage: failure.message,
              isCodeResendSuccess: false);
        },
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}
