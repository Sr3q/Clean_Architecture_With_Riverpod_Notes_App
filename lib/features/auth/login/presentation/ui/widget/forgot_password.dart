import 'package:clean_note_app/features/auth/common_auth/presentation/provider/auth_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPassword extends ConsumerWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          ref.read(authScreenProvider.notifier).navigateToRecoderPassword();
        },
        child: Text(
          'نسيت كلمة المرور؟',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
