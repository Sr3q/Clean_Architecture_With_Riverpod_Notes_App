import 'package:clean_note_app/features/auth/email_verification/presentation/provider/email_verification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EmailVerificationButton extends ConsumerWidget {
  final VoidCallback onPressed;
  const EmailVerificationButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(emailVerificationProvider.select((value) => value.isLoading));

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: 110,
              child: SpinKitDoubleBounce(
                color: Colors.white,
                size: 25,
              ),
            )
          : Text(
              'تاكيد الحساب',
              style: Theme.of(context).textTheme.labelMedium,
            ),
    );
  }
}
