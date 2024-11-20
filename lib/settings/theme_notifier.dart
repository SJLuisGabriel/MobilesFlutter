import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progmsn2024/settings/theme_settings.dart';

class ThemeNotifier extends ValueNotifier<ThemeData> {
  static const String keyTheme = 'selectedTheme';
  static const String keyFont = 'selectedFont';

  ThemeNotifier() : super(Themesettings.lightTheme()) {
    _loadThemeFromPrefs();
  }

  Future<void> _loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedTheme = prefs.getString(keyTheme) ?? 'light';
    final selectedFont = prefs.getString(keyFont) ?? 'Roboto';
    if (selectedTheme == 'dark') {
      value = Themesettings.darkTheme(font: selectedFont);
    } else if (selectedTheme == 'custom') {
      value = Themesettings.customTheme(font: selectedFont);
    } else {
      value = Themesettings.lightTheme(font: selectedFont);
    }
  }

  Future<void> setTheme(String themeName) async {
    final prefs = await SharedPreferences.getInstance();
    if (themeName == 'dark') {
      value =
          Themesettings.darkTheme(font: prefs.getString(keyFont) ?? 'Roboto');
      await prefs.setString(keyTheme, 'dark');
    } else if (themeName == 'custom') {
      value =
          Themesettings.customTheme(font: prefs.getString(keyFont) ?? 'Roboto');
      await prefs.setString(keyTheme, 'custom');
    } else {
      value =
          Themesettings.lightTheme(font: prefs.getString(keyFont) ?? 'Roboto');
      await prefs.setString(keyTheme, 'light');
    }
  }

  Future<void> setFont(String fontName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyFont, fontName);
    value = value.copyWith(
      textTheme: value.textTheme.apply(fontFamily: fontName),
    );
  }
}
