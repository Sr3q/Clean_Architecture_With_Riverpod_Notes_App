import 'package:clean_note_app/core/route/route_name.dart';
import 'package:clean_note_app/features/auth/logout/presentation/ui/widget/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  AppBar build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AppBar(
      leading: LogoutButton(),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: size.height * 0.08,
            width: size.width * 0.2,
          ),
          // SizedBox(width: size.width * 0.02),
          Text(
            'نوتسي',
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 40),
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {
              context.pushNamed(searchRoute);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ))
      ],
    );
  }
}
