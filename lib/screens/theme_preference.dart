import 'package:flutter/material.dart';
import 'package:progmsn2024/settings/theme_notifier.dart';
import 'package:progmsn2024/settings/theme_settings.dart';

class PreferencesScreen extends StatelessWidget {
  final ThemeNotifier themeNotifier;

  const PreferencesScreen({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferencias de Tema"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Elige tu tema preferido:",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Tema Claro
            Card(
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.wb_sunny, color: Colors.amber),
                title: const Text(
                  "Tema Claro",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Radio<String>(
                  value: 'light',
                  groupValue: themeNotifier.value == Themesettings.lightTheme()
                      ? 'light'
                      : themeNotifier.value == Themesettings.darkTheme()
                          ? 'dark'
                          : 'custom',
                  onChanged: (value) {
                    if (value != null) {
                      themeNotifier.setTheme('light');
                    }
                  },
                ),
              ),
            ),

            const Divider(),

            // Tema Oscuro
            Card(
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.nights_stay, color: Colors.blueGrey),
                title: const Text(
                  "Tema Oscuro",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Radio<String>(
                  value: 'dark',
                  groupValue: themeNotifier.value == Themesettings.darkTheme()
                      ? 'dark'
                      : themeNotifier.value == Themesettings.lightTheme()
                          ? 'light'
                          : 'custom',
                  onChanged: (value) {
                    if (value != null) {
                      themeNotifier.setTheme('dark');
                    }
                  },
                ),
              ),
            ),

            const Divider(),

            // Tema Personalizado
            Card(
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.palette, color: Colors.purple),
                title: const Text(
                  "Tema Personalizado",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Radio<String>(
                  value: 'custom',
                  groupValue: themeNotifier.value == Themesettings.customTheme()
                      ? 'custom'
                      : themeNotifier.value == Themesettings.lightTheme()
                          ? 'light'
                          : 'dark',
                  onChanged: (value) {
                    if (value != null) {
                      themeNotifier.setTheme('custom');
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
