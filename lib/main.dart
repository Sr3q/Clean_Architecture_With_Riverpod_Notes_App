import 'package:clean_note_app/core/data/local/shared_preferences/flutter_shared_preferences.dart';
import 'package:clean_note_app/features/start_up/presentation/ui/start_up_screen.dart';
import 'package:clean_note_app/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(
    ProviderScope(
      child: StartUpScreen(
        builder: (context) => const MainWidget(),
      ),
    ),
  );
}
