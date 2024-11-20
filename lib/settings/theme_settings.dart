import 'package:flutter/material.dart';

class Themesettings {
  static ThemeData lightTheme({String font = 'Montserrat'}) {
    return ThemeData.light().copyWith(
      primaryColor: Colors.blue,
      appBarTheme: const AppBarTheme(
        color: Colors.blue,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      scaffoldBackgroundColor: Colors.white,

      // Text Theme
      textTheme: TextTheme(
        bodyLarge:
            TextStyle(color: Colors.black, fontFamily: font, fontSize: 18),
        bodyMedium:
            TextStyle(color: Colors.black, fontFamily: font, fontSize: 16),
        headlineMedium: TextStyle(
          color: Colors.blue,
          fontFamily: font,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Dropdown Menu Theme (Checklists, Dropdowns)
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(color: Colors.black, fontFamily: font),
        menuStyle: MenuStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          surfaceTintColor: MaterialStateProperty.all(Colors.blue[50]),
        ),
      ),

      // Checkbox Theme (Checklists)
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.blue),
        checkColor: MaterialStateProperty.all(Colors.white),
        side: BorderSide(color: Colors.blue, width: 2),
      ),

      // Elevated Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          textStyle: TextStyle(
            fontFamily: font,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
      ),

      // InputDecoration for Text Fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[100],
        hintStyle: TextStyle(color: Colors.grey[600], fontFamily: font),
        labelStyle: TextStyle(color: Colors.blue, fontFamily: font),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  static ThemeData darkTheme({String font = 'Montserrat'}) {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.deepPurple,
      appBarTheme: const AppBarTheme(
        color: Colors.deepPurple,
      ),
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontFamily: font),
        bodyMedium: TextStyle(color: Colors.white, fontFamily: font),
      ),
    );
  }

  static ThemeData customTheme({String font = 'Montserrat'}) {
    return ThemeData(
      primaryColor: Colors.grey,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        color: Colors.grey,
      ),
      scaffoldBackgroundColor: Colors.grey[300],
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.black, fontFamily: font),
        bodyMedium: TextStyle(color: Colors.black, fontFamily: font),
      ),
    );
  }
}
