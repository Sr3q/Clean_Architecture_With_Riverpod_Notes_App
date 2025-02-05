import 'package:clean_note_app/common/provider/obscure_text_provider.dart';
import 'package:clean_note_app/common/show_messages/show_error_message.dart';
import 'package:clean_note_app/common/style/decorations/text_field_decoration.dart';
import 'package:clean_note_app/common/validations/validations.dart';
import 'package:clean_note_app/features/auth/common_auth/presentation/provider/auth_screen_provider.dart';
import 'package:clean_note_app/features/auth/register/presentation/provider/register_provider.dart';
import 'package:clean_note_app/features/auth/register/presentation/ui/widget/login_button.dart';
import 'package:clean_note_app/features/auth/register/presentation/ui/widget/register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegesterScreen extends ConsumerStatefulWidget {
  const RegesterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends ConsumerState<RegesterScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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

          //name text field
          TextFormField(
            controller: _nameController,
            validator: Validations.validateName,
            decoration: TextFieldDecoration.fieldDecoration(
              size,
              context,
              "الاسم",
              null,
              Icon(Icons.person),
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

          SizedBox(height: size.height * 0.03),

          //confirm password text field
          TextFormField(
            controller: _confirmPasswordController,
            validator: (val) {
              if (val != _passwordController.text) {
                return "كلمة المرور غير متطابقة";
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

          //register button
          RegisterButton(onPressed: _register),

          //login button
          LoginButton(),
        ],
      ),
    );
  }

  void _register() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final formData = {
        "email": _emailController.text,
        "password": _passwordController.text,
        "name": _nameController.text,
      };

      ref.read(registerProvider.notifier).setFormData(formData);

      ref.read(registerProvider.notifier).register();
    }
  }

  void _listener() {
    ref.listen(registerProvider.select((value) => value.errorMessage),
        (_, next) {
      if (next != null) {
        ShowErrorMessage.showMessage(context, next);
      }
    });

    ref.listen(registerProvider.select((value) => value.isRegisterSuccess),
        (_, next) {
      if (next) {
        ref.read(authScreenProvider.notifier).navigateToEmailVerifcation();
      }
    });
  }
}
