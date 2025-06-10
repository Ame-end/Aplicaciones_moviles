import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    appBarTheme: AppBarTheme(
      color: Colors.green[800],
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );

  static const TextStyle resultTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
