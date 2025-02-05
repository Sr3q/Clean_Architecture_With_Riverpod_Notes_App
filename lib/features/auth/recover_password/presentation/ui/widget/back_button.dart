import 'package:clean_note_app/features/auth/common_auth/presentation/provider/auth_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BackButton extends ConsumerWidget {
  final bool flg;
  const BackButton({super.key, required this.flg});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        if (flg) {
          ref.read(authScreenProvider.notifier).navigateToLogin();
        } else {
          ref.read(authScreenProvider.notifier).navigateToRecoderPassword();
        }
      },
      child: Text(
        'رجوع',
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Colors.orange),
      ),
    );
  }
}
