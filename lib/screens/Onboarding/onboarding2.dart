import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:progmsn2024/settings/theme_notifier.dart';

class OnboardingScreen2 extends StatelessWidget {
  final ThemeNotifier themeNotifier;

  const OnboardingScreen2({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Configura tu Tema")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lotties/AnimationTheme.json',
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20),
            const Text(
              "Selecciona el tema que prefieras.",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                themeNotifier.setTheme('light');
              },
              child: const Text("Tema Claro"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                themeNotifier.setTheme('dark');
              },
              child: const Text("Tema Oscuro"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                themeNotifier.setTheme('custom');
              },
              child: const Text("Tema Personalizado"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/onboarding3');
              },
              child: const Text("Siguiente"),
            ),
          ],
        ),
      ),
    );
  }
}
