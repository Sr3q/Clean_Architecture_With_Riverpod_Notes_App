import 'package:clean_note_app/features/start_up/presentation/provider/start_up_provider.dart';
import 'package:clean_note_app/features/start_up/presentation/ui/widget/start_up_error.dart';
import 'package:clean_note_app/features/start_up/presentation/ui/widget/start_up_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartUpScreen extends ConsumerWidget {
  final WidgetBuilder builder;
  const StartUpScreen({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startUp = ref.watch(startUpProvider);

    return startUp.when(
      data: (_) => builder(context),
      error: (error, stackTrace) => StartUpError(error: error),
      loading: () => const StartUpLoading(),
    );
  }
}
