import 'package:flutter/material.dart';
import 'package:progmsn2024/firebase/email_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final conUser = TextEditingController();
  final conPwd = TextEditingController();
  final conName = TextEditingController();
  EmailAuth auth = EmailAuth();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Campo de texto para el nombre
    TextFormField txtName = TextFormField(
      keyboardType: TextInputType.text,
      controller: conName,
      decoration: const InputDecoration(
        labelText: 'Nombre',
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(Icons.person, color: Colors.black),
        filled: true,
        fillColor: Colors.white,
      ),
      style: const TextStyle(color: Colors.black),
    );

    // Campo de texto para el usuario
    TextFormField txtUser = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: conUser,
      decoration: const InputDecoration(
        labelText: 'Usuario (Email)',
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(Icons.email, color: Colors.black),
        filled: true,
        fillColor: Colors.white,
      ),
      style: const TextStyle(color: Colors.black),
    );

    // Campo de texto para la contraseña
    final txtPwd = TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: conPwd,
      decoration: const InputDecoration(
        labelText: 'Contraseña',
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(Icons.lock, color: Colors.black),
        filled: true,
        fillColor: Colors.white,
      ),
      style: const TextStyle(color: Colors.black),
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
          crossAxisAlignment: CrossAxisAlignment
              .start, // Para alinear los textos a la izquierda
          children: [
            const Text(
              'Registro de Usuario',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            txtName,
            const SizedBox(height: 10),
            txtUser,
            const SizedBox(height: 10),
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
            isLoading = true;
          });

          final success =
              await auth.createUser(conName.text, conUser.text, conPwd.text);

          setState(() {
            isLoading = false;
          });

          if (success) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    'Usuario creado, verifica tu correo para activar la cuenta')));
            Navigator.pushNamed(context, "/login");
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error al crear el usuario')));
          }
        },
        child: const Text('Crear Usuario'),
      ),
    );

    final btnCancel = Positioned(
      width: screenWidth * 0.9,
      bottom: screenHeight * .003,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 249, 156, 144)),
        onPressed: () async {
          setState(() {
            isLoading = true; // Cambiar a true antes de la operación
          });
          await Future.delayed(const Duration(seconds: 2));
          Navigator.pushNamed(context, '/login');
          setState(() {
            isLoading = false;
          });
        },
        child: const Text('Cancelar'),
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
            ctnCredentials,
            btnLogin,
            btnCancel,
            if (isLoading) gifLoading else Container(),
          ],
        ),
      ),
    );
  }
}
