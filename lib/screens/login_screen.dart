import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final conUser = TextEditingController();
  final conPwd = TextEditingController();
  bool isLoading = false;

  Future<void> _setOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingSeen', true);
  }

  Future<bool> _getOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboardingSeen') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    TextFormField txtUser = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: conUser,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person),
        filled: true,
        fillColor: Colors.white,
      ),
    );

    final txtPwd = TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: conPwd,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.password),
        filled: true,
        fillColor: Colors.white,
      ),
    );

    final ctnCredentials = Positioned(
      bottom: screenHeight * 0.15,
      child: Container(
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            txtUser,
            const SizedBox(height: 5),
            txtPwd,
          ],
        ),
      ),
    );

    final btnLogin = Positioned(
      width: screenWidth * 0.9,
      bottom: screenHeight * .06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[200]),
        onPressed: () async {
          setState(() {
            isLoading = true; // Cambiar a true antes de la operación
          });

          await Future.delayed(const Duration(seconds: 2));

          bool onboardingSeen = await _getOnboardingSeen();
          if (onboardingSeen) {
            // Navigator.pushReplacementNamed(context, '/home');
            Navigator.pushReplacementNamed(context, '/onboarding1');
          } else {
            await _setOnboardingSeen();
            Navigator.pushReplacementNamed(context, '/onboarding1');
          }

          setState(() {
            isLoading = false;
          });
        },
        child: const Text('Validar Usuario'),
      ),
    );

    final gifLoading = Positioned(
      top: screenHeight * 0.1,
      child: Image.asset('assets/Kunst.gif'),
      width: 100,
    );

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/fondo.jpg"),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: screenHeight * 0.26,
              child: Image.asset(
                'assets/Kirby.jpg',
                width: screenWidth * 0.8,
              ),
            ),
            ctnCredentials,
            btnLogin,
            if (isLoading) gifLoading else Container(),
          ],
        ),
      ),
    );
  }
}
