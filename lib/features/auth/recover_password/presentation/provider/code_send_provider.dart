import 'package:clean_note_app/features/auth/recover_password/application/services/send_code_service.dart';
import 'package:clean_note_app/features/auth/recover_password/data/dto/request/send_code_request.dart';
import 'package:clean_note_app/features/auth/recover_password/presentation/state/send_code_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final codeSendProvider =
    AutoDisposeNotifierProvider<CodeSendProvider, SendCodeState>(
        CodeSendProvider.new);

class CodeSendProvider extends AutoDisposeNotifier<SendCodeState> {
  @override
  SendCodeState build() {
    return SendCodeState();
  }

  Future<void> sendCode() async {
    try {
      state = state.copyWith(
        isLoading: true,
        errorMessage: null,
        isCodeSendSuccess: false,
      );

      final request = SendCodeRequest(email: state.email);

      final result = await ref.read(sendCodeServiceProvider).sendCode(request);

      result.when(
        (success) {
          state = state.copyWith(isLoading: false, isCodeSendSuccess: true);
        },
        (failure) {
          state = state.copyWith(
            isLoading: false,
            errorMessage: failure.message,
            isCodeSendSuccess: false,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString(),isCodeSendSuccess: false,);
    }
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }
}
