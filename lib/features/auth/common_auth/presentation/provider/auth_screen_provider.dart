import 'package:clean_note_app/features/auth/email_verification/presentation/ui/email_verification_screen.dart';
import 'package:clean_note_app/features/auth/login/presentation/ui/login_screen.dart';
import 'package:clean_note_app/features/auth/recover_password/presentation/ui/code_verification_reset_password_screen.dart';
import 'package:clean_note_app/features/auth/recover_password/presentation/ui/recover_password_screen.dart';
import 'package:clean_note_app/features/auth/register/presentation/ui/regester_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authScreenProvider =
    AutoDisposeNotifierProvider<AuthScreen, Widget>(AuthScreen.new);

class AuthScreen extends AutoDisposeNotifier<Widget> {
  @override
  Widget build() {
    return const LoginScreen(key: ValueKey('loginScreen'));
  }

  void navigateToRegister() {
    state = const RegesterScreen(key: ValueKey('registerScreen'));
  }

  void navigateToLogin() {
    state = const LoginScreen(key: ValueKey('loginScreen'));
  }

  void navigateToRecoderPassword() {
    state = const RecoverPasswordScreen(key: ValueKey('recoverPasswordScreen'));
  }

  void navigateToCodeVerificationResetPassword() {
    state = const CodeVerificationResetPasswordScreen(
        key: ValueKey('codeVerificationScreen'));
  }

  void navigateToEmailVerifcation() {
    state =
        const EmailVerificationScreen(key: ValueKey('emailVerificationScreen'));
  }
}
