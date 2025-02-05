import 'package:clean_note_app/common/provider/obscure_text_provider.dart';
import 'package:clean_note_app/common/show_messages/show_error_message.dart';
import 'package:clean_note_app/common/style/decorations/text_field_decoration.dart';
import 'package:clean_note_app/common/validations/validations.dart';
import 'package:clean_note_app/core/route/route_name.dart';
import 'package:clean_note_app/features/auth/common_auth/presentation/provider/auth_provider.dart';
import 'package:clean_note_app/features/auth/common_auth/presentation/provider/auth_screen_provider.dart';
import 'package:clean_note_app/features/auth/login/presentation/provider/login_provider.dart';
import 'package:clean_note_app/features/auth/login/presentation/ui/widget/forgot_password.dart';
import 'package:clean_note_app/features/auth/login/presentation/ui/widget/login_button.dart';
import 'package:clean_note_app/features/auth/login/presentation/ui/widget/register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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

          //password text field
          TextFormField(
            controller: _passwordController,
            validator: Validations.validatePassword,
            obscureText: ref.watch(obscureTextProvider),
            decoration: TextFieldDecoration.fieldDecoration(
              size,
              context,
              "كلمة المرور",
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

          //forgot password
          ForgotPassword(),

          //login button
          LoginButton(onPressed: _login),

          //register button
          RegisterButton(),
        ],
      ),
    );
  }

  void _login() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final formData = {
        "email": _emailController.text,
        "password": _passwordController.text,
      };

      ref.read(loginProvider.notifier).setFormData(formData);

      ref.read(loginProvider.notifier).login();
    }
  }

  void _listener() {
    ref.listen(loginProvider.select((value) => value.errorMessage), (_, next) {
      if (next != null) {
        ShowErrorMessage.showMessage(context, next);
      }
    });

    ref.listen(loginProvider.select((value) => value.isLoginSuccess),
        (_, next) {
      if (next) {
        bool isEmailVerified =
            ref.read(authProvider).user!.emailVerifiedAt != null;
        if (isEmailVerified) {
          context.goNamed(homeRoute);
        } else {
          ref.read(authScreenProvider.notifier).navigateToEmailVerifcation();
        }
      }
    });
  }
}
