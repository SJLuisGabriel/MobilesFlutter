import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  // Controladores para los campos de texto
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PhoneController = TextEditingController();
  final TextEditingController _GitController = TextEditingController();

  String? _selectedGender; // Variable para almacenar la selección de género

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future<void> _pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  // Función para enviar correo
  Future<void> _sendEmail() async {
    final email = _EmailController.text;

    final Uri emailUri = Uri(
      scheme: 'https',
      host: 'mail.google.com',
      path: 'mail/?view=cm&fs=1&to=$email&su=Asunto&body=Cuerpo+del+mensaje',
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo abrir la página de Gmail.')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Error al intentar abrir Gmail en el navegador.')),
      );
    }
  }

  // Función para llamar por teléfono
  Future<void> _callPhone() async {
    final phone = _PhoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
    try {
      await FlutterPhoneDirectCaller.callNumber(phone);
    } catch (e) {
      print('Error: $e');
    }
  }

  // Función para abrir el perfil de GitHub en el navegador
  Future<void> _openGitHub() async {
    String githubUrl = _GitController.text.trim();

    if (!githubUrl.startsWith('https://')) {
      githubUrl = 'https://github.com/$githubUrl';
    }

    final Uri gitUri = Uri.parse(githubUrl);

    try {
      if (await canLaunchUrl(gitUri)) {
        await launchUrl(gitUri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('No se pudo abrir el perfil de GitHub.')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al intentar abrir GitHub.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo para la foto de perfil
            Center(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.camera_alt),
                            title: const Text('Tomar Foto'),
                            onTap: () {
                              Navigator.pop(context);
                              _pickImageFromCamera();
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text('Escoger De La Galeria'),
                            onTap: () {
                              Navigator.pop(context);
                              _pickImage();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      _image != null ? FileImage(File(_image!.path)) : null,
                  child: _image == null
                      ? const Icon(Icons.camera_alt, size: 50)
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedGender,
              hint: const Text("Seleccionar Género"),
              dropdownColor: Colors.grey[200],
              style: const TextStyle(color: Colors.black),
              items:
                  <String>['Masculino', 'Femenino', 'Otro'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGender = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            // Campo de texto para el nombre
            TextField(
              controller: _NameController,
              decoration: const InputDecoration(
                hintText: "Nombre",
                helperText: "Nombre Completo",
                labelText: 'Luis Gabriel Sanchez Jungo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Campo de texto para el correo
            TextField(
              controller: _EmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Correo",
                helperText: "Correo",
                labelText: '19031333@itcelaya.edu.mx',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Campo de texto para el teléfono
            TextField(
              controller: _PhoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "Teléfono",
                helperText: "Teléfono",
                labelText: '461 299 1772',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Campo de texto para el GitHub
            TextField(
              controller: _GitController,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(
                hintText: "GitHub",
                helperText: "GitHub",
                labelText: 'https://github.com/SJLuisGabriel',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Botones para correo, teléfono y URL
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.email),
                  onPressed: _sendEmail,
                ),
                IconButton(
                  icon: const Icon(Icons.phone),
                  onPressed: _callPhone,
                ),
                IconButton(
                  icon: const Icon(Icons.account_box),
                  onPressed: _openGitHub,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
