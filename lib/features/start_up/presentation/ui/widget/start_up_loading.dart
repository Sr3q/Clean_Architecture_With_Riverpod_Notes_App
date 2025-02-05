import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StartUpLoading extends ConsumerWidget {
  const StartUpLoading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/logo.png',
                height: size.height * 0.2,
              ),
              
              SizedBox(height: size.height * 0.1),

              const SpinKitDoubleBounce(color: Colors.white, size: 40),
            ],
          ),
        ),
      ),
    );
  }
}
