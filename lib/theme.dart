import 'package:flutter/material.dart';

class DotaTheme {
  static ThemeData get heroesTheme {
    //1
    return ThemeData(
        //2
        primarySwatch: heroes,
        primaryColor: heroes,
        scaffoldBackgroundColor: heroes.shade400,
        textTheme: TextTheme(
          subtitle2: const TextStyle(fontSize: 14.0, color: Colors.white),
            bodyText1: TextStyle(fontSize: 14.0, color: heroes.shade300),
            bodyText2: TextStyle(fontSize: 12.0, color: heroes.shade300),
          caption: TextStyle(fontSize: 14.0, color: heroes.shade400)
        ),
        buttonTheme: ButtonThemeData(
          // 4
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          buttonColor: heroes,
        ));
  }

  static const MaterialColor heroes =
      MaterialColor(_heroesPrimaryValue, <int, Color>{
    50: Color(0xFFE6E6E6),
    100: Color(0xFFBFBFBF),
    200: Color(0xFF959595),
    300: Color(0xFF6B6B6B),
    400: Color(0xFF4B4B4B),
    500: Color(_heroesPrimaryValue),
    600: Color(0xFF262626),
    700: Color(0xFF202020),
    800: Color(0xFF1A1A1A),
    900: Color(0xFF101010),
  });
  static const int _heroesPrimaryValue = 0xFF2B2B2B;

  static const MaterialColor heroesAccent =
      MaterialColor(_heroesAccentValue, <int, Color>{
    100: Color(0xFFEE6969),
    200: Color(_heroesAccentValue),
    400: Color(0xFFF10000),
    700: Color(0xFFD80000),
  });
  static const int _heroesAccentValue = 0xFFE93B3B;
}
