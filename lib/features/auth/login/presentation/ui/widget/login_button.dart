import 'package:clean_note_app/features/auth/login/presentation/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginButton extends ConsumerWidget {
  final VoidCallback onPressed;
  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(loginProvider.select((value) => value.isLoading));

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
              'دخول',
              style: Theme.of(context).textTheme.labelMedium,
            ),
    );
  }
}
