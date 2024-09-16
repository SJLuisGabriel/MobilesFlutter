import 'package:flutter/material.dart';

class Themesettings {
  static ThemeData lightTheme() {
    final theme = ThemeData.light();
    return theme.copyWith(
      scaffoldBackgroundColor: const Color(0xFFECECEC), // Fondo claro
      primaryColor: Colors.blueAccent,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blueAccent,
        elevation: 4,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black87, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.black54, fontSize: 14),
        titleLarge: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        shadowColor: Colors.grey,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: 24,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  static ThemeData darkTheme() {
    final theme = ThemeData.dark();
    return theme.copyWith(
      primaryColor: Colors.blueGrey, // Azul grisáceo claro para el tema oscuro
      scaffoldBackgroundColor:
          const Color(0xFF303030), // Fondo oscuro más claro
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF424242), // Un gris claro en la AppBar
        elevation: 4,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF616161), // Gris claro para FAB
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF757575), // Botones gris más claro
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white70, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.white60, fontSize: 14),
        titleLarge: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF424242), // Fondo de las tarjetas más claro
        shadowColor: Colors.black,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor:
            const Color(0xFF616161), // Fondo gris claro para campos de entrada
      ),
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 255, 0, 0),
        size: 24,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor:
            Color(0xFF424242), // Fondo de barra de navegación gris claro
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
