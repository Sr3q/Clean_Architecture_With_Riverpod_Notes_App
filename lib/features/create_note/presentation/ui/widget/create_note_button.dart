import 'package:clean_note_app/features/create_note/presentation/provider/create_note_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CreateNoteButton extends ConsumerWidget {
  final VoidCallback onPressed;
  const CreateNoteButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(createNoteProvider.select((value) => value.isLoading));

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
              'حفظ',
              style: Theme.of(context).textTheme.labelMedium,
            ),
    );
  }
}
