import 'package:clean_note_app/features/delete_update_note/presentation/provider/delete_note_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DeleteNoteButton extends ConsumerWidget {
  final VoidCallback onPressed;

  const DeleteNoteButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(deleteNoteProvider.select((value) => value.isLoading));
        
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? SpinKitThreeBounce(
              color: Colors.orange,
              size: 25,
            )
          : Text(
              'حذف',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.orange),
            ),
    );
  }
}
