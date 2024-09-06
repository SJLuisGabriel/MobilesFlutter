import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Controladores para los campos de texto
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PhoneController = TextEditingController();
  final TextEditingController _GitController = TextEditingController();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      }
    });
  }

  Future<void> _pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Profile'),
      //   backgroundColor: Colors.blue,
      // ),
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
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? const Icon(Icons.camera_alt, size: 50)
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Nombre
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
            // Correo
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
            // Teléfono
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
            // GitHub
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
          ],
        ),
      ),
    );
  }
}


// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Screen'),
//       ),
//       body: Center(
//         child: Text('Content goes here'),
//       ),
//       bottomNavigationBar: ConvexAppBar(
//         style: TabStyle.react,
//         items: [
//           TabItem(icon: Icons.home, title: 'Home'),
//           TabItem(icon: Icons.search, title: 'Search'),
//           TabItem(icon: Icons.person, title: 'Profile'),
//         ],
//         initialActiveIndex: 2,
//         onTap: (int index) {
//           if (index == 2) {
//             // Navega a ProfileScreen cuando se seleccione el icono de perfil
//             if (ModalRoute.of(context)?.settings.name != '/profile') {
//               Navigator.pushNamed(context, '/profile');
//             }
//           } else {
//             print('Tab $index selected');
//           }
//         },
//       ),
//     );
//   }
// }
