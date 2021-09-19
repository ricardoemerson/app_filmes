import 'package:flutter/material.dart';

class AppConfig {
  AppConfig._();

  static String get title => 'Filmes App';
  static ThemeData theme = ThemeData(
    fontFamily: 'Metropolis',
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Color(0xff222222),
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
