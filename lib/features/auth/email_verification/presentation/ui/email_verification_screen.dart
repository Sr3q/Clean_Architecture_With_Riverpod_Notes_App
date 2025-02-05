import 'package:clean_note_app/common/show_messages/show_error_message.dart';
import 'package:clean_note_app/common/show_messages/show_success_message.dart';
import 'package:clean_note_app/common/style/decorations/text_field_decoration.dart';
import 'package:clean_note_app/core/route/route_name.dart';
import 'package:clean_note_app/features/auth/email_verification/presentation/provider/email_verification_provider.dart';
import 'package:clean_note_app/features/auth/email_verification/presentation/provider/resend_code_provider.dart';
import 'package:clean_note_app/features/auth/email_verification/presentation/ui/widget/email_verification_button.dart';
import 'package:clean_note_app/features/auth/email_verification/presentation/ui/widget/resend_code_button.dart';
import 'package:clean_note_app/features/auth/email_verification/presentation/ui/widget/back_button.dart'
    as back_button;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends ConsumerState<EmailVerificationScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController otpController;

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _emailVerificationListener();
    _resendCodeListener();

    final size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: size.height * 0.02),

          Text(
            "الرجاء ادخال الرمز الذي ارسل لبريدك الالكتروني لتاكيد الحساب.",
            style: Theme.of(context).textTheme.bodySmall,
          ),

          SizedBox(height: size.height * 0.03),

          TextFormField(
            controller: otpController,
            decoration: TextFieldDecoration.fieldDecoration(
              size,
              context,
              "رمز التاكيد",
              null,
              Icon(Icons.check_circle),
              null,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter OTP';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.03),

          // Resend Code Button
          ResendCodeButton(onPressed: _resendCode),

          // Email Verification Button
          EmailVerificationButton(onPressed: _emailVerification),

          // back button
          back_button.BackButton(),
        ],
      ),
    );
  }

  void _emailVerification() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      ref.read(emailVerificationProvider.notifier).setOtp(otpController.text);

      ref.read(emailVerificationProvider.notifier).emailVerification();
    }
  }

  void _emailVerificationListener() {
    ref.listen(
        emailVerificationProvider
            .select((value) => value.isEmailVerificationSuccess), (_, next) {
      if (next) {
        context.go(homeRoute);
      }
    });

    ref.listen(emailVerificationProvider.select((value) => value.errorMessage),
        (_, next) {
      if (next != null) {
        ShowErrorMessage.showMessage(context, next);
      }
    });
  }

  void _resendCode() {
    ref.read(resendCodeProvider.notifier).resendCode();
  }

  void _resendCodeListener() {
    ref.listen(resendCodeProvider.select((value) => value.isCodeResendSuccess),
        (_, next) {
      if (next) {
        ShowSuccessMessage.showMessage(context, "تم ارسال رمز التاكيد");
      }
    });

    ref.listen(resendCodeProvider.select((value) => value.errorMessage),
        (_, next) {
      if (next != null) {
        ShowErrorMessage.showMessage(context, next);
      }
    });
  }
}
