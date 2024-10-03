import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bienvenido")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lotties/AnimationWelcome.json',
              width: 250,
              height: 250,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20),
            const Text(
              "¡Bienvenido!",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              "En esta APP se desarrollará una aplicación para reproducir películas.",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              "Además, con esta APP se integrarán actividades para practicar el uso de FLUTTER.",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/onboarding2');
              },
              child: const Text("Comenzar"),
            ),
          ],
        ),
      ),
    );
  }
}
