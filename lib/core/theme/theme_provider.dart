import 'package:clean_note_app/core/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = NotifierProvider<ThemeState,ThemeData>(ThemeState.new);

class ThemeState extends Notifier<ThemeData> {
  @override
  ThemeData build() {
    return ThemeConfig.lightTheme;
  }

  void toggleTheme() {
    state = state == ThemeConfig.lightTheme
        ? ThemeConfig.darkTheme
        : ThemeConfig.lightTheme;
  }
}
