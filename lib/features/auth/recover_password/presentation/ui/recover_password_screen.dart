import 'package:clean_note_app/common/show_messages/show_error_message.dart';
import 'package:clean_note_app/common/style/decorations/text_field_decoration.dart';
import 'package:clean_note_app/common/validations/validations.dart';
import 'package:clean_note_app/features/auth/common_auth/presentation/provider/auth_screen_provider.dart';
import 'package:clean_note_app/features/auth/recover_password/presentation/provider/code_send_provider.dart';
import 'package:clean_note_app/features/auth/recover_password/presentation/provider/code_verification_provider.dart';
import 'package:clean_note_app/features/auth/recover_password/presentation/ui/widget/code_send_button.dart';
import 'package:clean_note_app/features/auth/recover_password/presentation/ui/widget/back_button.dart'
    as back_button;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecoverPasswordScreen extends ConsumerStatefulWidget {
  const RecoverPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends ConsumerState<RecoverPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
            "لاتشعر بالاسوء, تحدث احيانا.",
            style: Theme.of(context).textTheme.bodySmall,
          ),

          SizedBox(height: size.height * 0.03),

          //email text field
          TextFormField(
            controller: _emailController,
            validator: Validations.validateEmail,
            decoration: TextFieldDecoration.fieldDecoration(
              size,
              context,
              "البريد الإكتروني",
              null,
              Icon(Icons.email),
              null,
            ),
          ),

          SizedBox(height: size.height * 0.03),

          Text(
            "سوف نرسل رمز الاسترداد الى هذا البريد الاكتروني.",
            style: Theme.of(context).textTheme.bodySmall,
          ),

          SizedBox(height: size.height * 0.02),

          //send code button
          CodeSendButton(onPressed: _sendCode),

          //back button
          back_button.BackButton(flg: true),
        ],
      ),
    );
  }

  void _sendCode() {
    final isVaild = _formKey.currentState!.validate();

    if (isVaild) {
      ref.read(codeSendProvider.notifier).setEmail(_emailController.text);
      ref.read(codeSendProvider.notifier).sendCode();
    }
  }

  void _listener() {
    ref.listen(codeSendProvider.select((value) => value.errorMessage),
        (_, next) {
      if (next != null) {
        ShowErrorMessage.showMessage(context, next);
      }
    });

    ref.listen(codeSendProvider.select((value) => value.isCodeSendSuccess),
        (_, next) {
      if (next) {
        ref
            .read(codeVerificationProvider.notifier)
            .setEmail(_emailController.text);
        ref
            .read(authScreenProvider.notifier)
            .navigateToCodeVerificationResetPassword();
      }
    });
  }
}
