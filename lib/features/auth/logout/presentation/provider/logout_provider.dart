import 'package:clean_note_app/features/auth/common_auth/presentation/provider/auth_provider.dart';
import 'package:clean_note_app/features/auth/logout/application/services/logout_service.dart';
import 'package:clean_note_app/features/auth/logout/presentation/state/logout_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final logoutProvider = AutoDisposeNotifierProvider<LogoutProvider, LogoutState>(
    LogoutProvider.new);

class LogoutProvider extends AutoDisposeNotifier<LogoutState> {
  @override
  LogoutState build() {
    return LogoutState();
  }

  Future<void> logout() async {
    try {
      state =
          state.copyWith(isLoading: true, isSuccess: false, errorMessage: null);

      final result = await ref.read(logoutServiceProvider).logout();

      result.when(
        (success) {
          state = state.copyWith(isLoading: false, isSuccess: true);

          ref.read(authProvider.notifier).removeAuthState();
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
}
