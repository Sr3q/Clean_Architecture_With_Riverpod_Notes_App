import 'package:clean_note_app/core/theme/theme_provider.dart';
import 'package:clean_note_app/core/route/go_router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainWidget extends ConsumerWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'), // English
      ],
      title: 'notesy',
      theme: ref.watch(themeProvider),
      routerConfig: goRouter,
    );
  }
}
