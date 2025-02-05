import 'package:clean_note_app/features/auth/common_auth/presentation/provider/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final startUpProvider = FutureProvider<void>((ref) async {
  await Future.microtask(() => ref.read(authProvider.notifier).getAuthState());

  // await Future.delayed(const Duration(seconds: 2));
});
