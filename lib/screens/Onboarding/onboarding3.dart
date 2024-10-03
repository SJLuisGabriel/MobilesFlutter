import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  Future<void> _launchURL() async {
    final Uri url =
        Uri.parse('https://www.uifrommars.com/que-es-un-onboarding-ejemplos/');

    if (!await launchUrl(url)) {
      throw 'No se pudo abrir el enlace $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Información Adicional"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lotties/AnimationInformation.json',
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20),
            const Text(
              "Aquí puedes encontrar más información sobre el uso de Onboarding.",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _launchURL,
              child: const Text("Ver más sobre Onboarding"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text("Ir a la App"),
            ),
          ],
        ),
      ),
    );
  }
}
