import 'package:clean_note_app/common/show_messages/show_error_message.dart';
import 'package:clean_note_app/common/show_messages/show_success_message.dart';
import 'package:clean_note_app/core/route/route_name.dart';
import 'package:clean_note_app/features/auth/logout/presentation/provider/logout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class LogoutButton extends ConsumerStatefulWidget {
  const LogoutButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends ConsumerState<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    _lisener();

    final isLoading =
        ref.watch(logoutProvider.select((value) => value.isLoading));

    return IconButton(
      icon: isLoading
          ? const SpinKitThreeBounce(
              color: Colors.black,
              size: 25,
            )
          : const Icon(
              Icons.logout,
              color: Colors.black,
            ),
      onPressed:isLoading ? null : _logout,
    );
  }

  void _logout() {
    ref.read(logoutProvider.notifier).logout();
  }

  void _lisener() {
    ref.listen(logoutProvider.select((value) => value.isSuccess), (_, next) {
      if (next) {
        ShowSuccessMessage.showMessage(context, "الى اللقاء");
        context.goNamed(authRoute);
      }
    });

    ref.listen(logoutProvider.select((value) => value.errorMessage), (_, next) {
      if (next != null) {
        ShowErrorMessage.showMessage(context, next);
      }
    });
  }
}
