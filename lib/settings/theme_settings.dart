import 'package:flutter/material.dart';

class Themesettings {
  static ThemeData lightTheme(BuildContext context) {
    final theme = ThemeData.light();
    return theme.copyWith(
      colorScheme: Theme.of(context)
          .colorScheme
          .copyWith(primary: const Color.fromARGB(255, 255, 27, 27)),
      scaffoldBackgroundColor: const Color(0xFFF3F4F6),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.red,
      appBarTheme: AppBarTheme(
        backgroundColor: const Color.fromARGB(255, 54, 244, 171),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color.fromARGB(255, 0, 255, 8),
      ),
    );
  }
}
