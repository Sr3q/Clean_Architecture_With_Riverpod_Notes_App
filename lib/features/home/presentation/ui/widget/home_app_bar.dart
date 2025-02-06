import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  AppBar build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.logout,
          color: Colors.black,
        ),
        onPressed: () async {},
      ),
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
              // navigator(const SearchScreen(), context);
              // notesProvider.getToken();
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ))
      ],
    );
  }
}
