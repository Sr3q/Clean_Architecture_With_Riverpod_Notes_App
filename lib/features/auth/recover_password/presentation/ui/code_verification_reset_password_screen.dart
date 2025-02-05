import 'package:clean_note_app/common/provider/obscure_text_provider.dart';
import 'package:clean_note_app/common/show_messages/show_error_message.dart';
import 'package:clean_note_app/common/show_messages/show_success_message.dart';
import 'package:clean_note_app/common/style/decorations/text_field_decoration.dart';
import 'package:clean_note_app/common/validations/validations.dart';
import 'package:clean_note_app/features/auth/common_auth/presentation/provider/auth_screen_provider.dart';
import 'package:clean_note_app/features/auth/recover_password/presentation/provider/code_verification_provider.dart';
import 'package:clean_note_app/features/auth/recover_password/presentation/ui/widget/code_verification_reset_password_button.dart';
import 'package:clean_note_app/features/auth/recover_password/presentation/ui/widget/back_button.dart'
    as back_button;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeVerificationResetPasswordScreen extends ConsumerStatefulWidget {
  const CodeVerificationResetPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CodeVerificationResetPasswordScreenState();
}

class _CodeVerificationResetPasswordScreenState
    extends ConsumerState<CodeVerificationResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _otpController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    ref.invalidate(codeVerificationProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listener();

    final size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: size.height * 0.02),

          Text(
            "تم ارسال الرمز الى البريد.",
            style: Theme.of(context).textTheme.bodySmall,
          ),

          SizedBox(height: size.height * 0.03),

          //otp text field
          TextFormField(
            controller: _otpController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter OTP';
              }
              return null;
            },
            decoration: TextFieldDecoration.fieldDecoration(
              size,
              context,
              "رمز التحقق",
              null,
              Icon(Icons.check_circle),
              null,
            ),
          ),

          SizedBox(height: size.height * 0.03),

          //password text field
          TextFormField(
            controller: _passwordController,
            validator: Validations.validatePassword,
            obscureText: ref.watch(obscureTextProvider),
            decoration: TextFieldDecoration.fieldDecoration(
              size,
              context,
              "كلمة المرور الجديدة",
              null,
              Icon(Icons.lock),
              IconButton(
                onPressed: () {
                  ref.read(obscureTextProvider.notifier).toggle();
                },
                icon: const Icon(
                  Icons.visibility,
                ),
              ),
            ),
          ),

          SizedBox(height: size.height * 0.03),

          //confirm password text field
          TextFormField(
            controller: _confirmPasswordController,
            validator: (val) {
              if (val != _passwordController.text) {
                return "كلمة المرور غير متطابقة.";
              }
              return null;
            },
            obscureText: ref.watch(obscureTextProvider),
            decoration: TextFieldDecoration.fieldDecoration(
              size,
              context,
              "تاكيد كلمة المرور",
              null,
              Icon(Icons.lock),
              IconButton(
                onPressed: () {
                  ref.read(obscureTextProvider.notifier).toggle();
                },
                icon: const Icon(
                  Icons.visibility,
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),

          //reset password button
          CodeVerificationResetPasswordButton(
              onPressed: _codeVerificationResetPassword),

          //back button
          back_button.BackButton(flg: false),
        ],
      ),
    );
  }

  void _codeVerificationResetPassword() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final formData = {
        "otp": _otpController.text,
        "password": _passwordController.text,
      };

      ref.read(codeVerificationProvider.notifier).setForm(formData);
      ref.read(codeVerificationProvider.notifier).verifyCode();
    }
  }

  void _listener() {
    ref.listen(codeVerificationProvider.select((value) => value.errorMessage),
        (_, next) {
      if (next != null) {
        ShowErrorMessage.showMessage(context, next);
      }
    });

    ref.listen(
        codeVerificationProvider
            .select((value) => value.isPasswordChangeSuccess), (_, next) {
      if (next) {
        ShowSuccessMessage.showMessage(context, "تم تغيير كلمة المرور بنجاح!");
        ref.read(authScreenProvider.notifier).navigateToLogin();
      }
    });
  }
}
