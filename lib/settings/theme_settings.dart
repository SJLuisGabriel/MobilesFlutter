import 'package:flutter/material.dart';

class Themesettings {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      primaryColor: Colors.blue,
      appBarTheme: const AppBarTheme(
        color: Colors.blue,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.deepPurple,
      appBarTheme: const AppBarTheme(
        color: Colors.deepPurple,
      ),
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
      ),
    );
  }

  static ThemeData customTheme() {
    return ThemeData(
      primaryColor: Colors.grey,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        color: Colors.grey,
      ),
      scaffoldBackgroundColor: Colors.grey[300],
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
      ),
    );
  }
}
