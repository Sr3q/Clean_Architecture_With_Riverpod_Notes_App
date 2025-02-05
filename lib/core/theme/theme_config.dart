import 'package:flutter/material.dart';

class ThemeConfig {
  //Colors for theme
  static Color lightPrimary = Colors.orangeAccent;
  static Color darkPrimary = const Color(0xff1f1f1f);
  static Color lightInversePrimary = Colors.white;
  static Color darkInversePrimary = Colors.white;
  static Color lightAccent = Colors.black;
  static Color darkAccent = Colors.grey;
  static Color lightBG = Colors.white;
  static Color darkBG = const Color(0xff121212);
  static Color lightLabel = Colors.deepOrange;
  static Color badgeColor = Colors.red;

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: lightPrimary,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      backgroundColor: lightPrimary,
      //elevation: 0,
      toolbarTextStyle: TextTheme(
        titleLarge: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ).bodyMedium,
      titleTextStyle: TextTheme(
        titleLarge: TextStyle(
          color: lightAccent,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ).titleLarge,
      centerTitle: true,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: lightPrimary,
      secondary: lightAccent,
      inversePrimary: lightInversePrimary,
      surface: lightBG,
      brightness: Brightness.light,
    ),
    fontFamily: 'ElMessiri',
    textTheme: ThemeData.light().textTheme.copyWith(
          titleSmall: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
          titleMedium: const TextStyle(
            color: Colors.blue,
            fontSize: 22,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: lightAccent,
            fontSize: 26,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
          labelMedium: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
          bodySmall:const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'ElMessiri',
            //fontWeight: FontWeight.bold,
          ), 
        ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(lightPrimary),
        iconColor: WidgetStateProperty.all<Color>(lightInversePrimary),
      ),
    ),
    iconTheme: IconThemeData(color: lightAccent),
    // indicatorColor: Colors.white,
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: darkBG,
    appBarTheme: AppBarTheme(
      backgroundColor: darkPrimary,
      //elevation: 0,
      toolbarTextStyle: TextTheme(
        titleLarge: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ).bodyMedium,
      titleTextStyle: TextTheme(
        titleLarge: TextStyle(
          color: darkAccent,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ).titleLarge,
      centerTitle: true,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: darkPrimary,
      secondary: darkAccent,
      inversePrimary: darkInversePrimary,
      surface: darkBG,
      brightness: Brightness.dark,
    ),
    fontFamily: 'ElMessiri',
    textTheme: ThemeData.light().textTheme.copyWith(
          titleSmall: TextStyle(
            color: darkAccent,
            fontSize: 20,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
          titleLarge: const TextStyle(
            color: Colors.blue,
            fontSize: 26,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
          labelMedium: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'ElMessiri',
            //fontWeight: FontWeight.bold,
          ),
        ),
    useMaterial3: true,
  );
}
