import 'package:clean_note_app/features/auth/email_verification/presentation/provider/resend_code_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ResendCodeButton extends ConsumerWidget {
  final VoidCallback? onPressed;
  const ResendCodeButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(resendCodeProvider.select((value) => value.isLoading));

    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SpinKitThreeBounce(
                color: Theme.of(context).colorScheme.primary,
                size: 25,
              )
            : Text(
                'لم يصلك الرمز؟',
                style: Theme.of(context).textTheme.bodySmall,
              ),
      ),
    );
  }
}
