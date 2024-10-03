import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progmsn2024/settings/theme_settings.dart';

class ThemeNotifier extends ValueNotifier<ThemeData> {
  static const String keyTheme = 'selectedTheme';

  ThemeNotifier() : super(Themesettings.lightTheme()) {
    _loadThemeFromPrefs();
  }

  Future<void> _loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedTheme = prefs.getString(keyTheme) ?? 'light';
    if (selectedTheme == 'dark') {
      value = Themesettings.darkTheme();
    } else if (selectedTheme == 'custom') {
      value = Themesettings.customTheme();
    } else {
      value = Themesettings.lightTheme();
    }
  }

  Future<void> setTheme(String themeName) async {
    final prefs = await SharedPreferences.getInstance();
    if (themeName == 'dark') {
      value = Themesettings.darkTheme();
      await prefs.setString(keyTheme, 'dark');
    } else if (themeName == 'custom') {
      value = Themesettings.customTheme();
      await prefs.setString(keyTheme, 'custom');
    } else {
      value = Themesettings.lightTheme();
      await prefs.setString(keyTheme, 'light');
    }
  }
}
