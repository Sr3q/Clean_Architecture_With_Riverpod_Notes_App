import 'package:clean_note_app/features/auth/common_auth/presentation/provider/auth_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    debugPrint("rebuild");

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/logo.png',
                height: size.height * 0.2,
              ),
              SizedBox(height: size.height * 0.005),

              // Title
              Text(
                'نوتسي',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 50),
              ),
              SizedBox(height: size.height * 0.05),

              // Auth Card
              Consumer(
                builder: (context, ref, child) {
                  final currentScreen = ref.watch(authScreenProvider);

                  return AnimatedSwitcher(
                    duration:
                        const Duration(milliseconds: 300), // Animation speed
                    transitionBuilder: (widget, animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1, 0), // Slide in from right
                          end: Offset.zero,
                        ).animate(animation),
                        child: widget,
                      );
                    },
                    child: Card(
                      key: currentScreen.key,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.11),
                      child: Padding(
                        padding: EdgeInsets.all(size.width * 0.05),
                        child: currentScreen,
                      ),
                    ), // This will animate between different screens
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
