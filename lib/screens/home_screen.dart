import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:progmsn2024/provider/test_provider.dart';
import 'package:progmsn2024/screens/coffe_app_screen.dart';
import 'package:progmsn2024/screens/profile_screen.dart';
import 'package:progmsn2024/settings/colors_settings.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:progmsn2024/settings/global_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final _key = GlobalKey<ExpandableFabState>();
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final testProvider = Provider.of<TestProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsSettings.navColor,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.access_alarm_outlined)),
          GestureDetector(
            onTap: () {
              _showImageOptions();
            },
            child: MouseRegion(
              cursor: MouseCursor.defer,
              child: CircleAvatar(
                backgroundImage: _image != null
                    ? FileImage(File(_image!.path))
                    : const AssetImage('assets/elephant_cthulhu_icon.png'),
                child: _image == null
                    ? Image.asset("assets/elephant_cthulhu_icon.png")
                    : null,
              ),
            ),
          ),
        ],
      ),
      body: Builder(builder: (context) {
        switch (index) {
          case 0:
            return const HomePage();
          case 1:
            return const ProfileScreen();
          case 2:
          default:
            return const HomePage();
        }
      }),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         decoration: const BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Column(
      //           children: [
      //             CircleAvatar(
      //               backgroundImage: _image != null
      //                   ? Image.network(_image!.path).image
      //                   : const AssetImage('assets/elephant_cthulhu_icon.png'),
      //               radius: 40,
      //             ),
      //             const SizedBox(height: 10),
      //             const Text(
      //               'Luis Gabriel Sanchez Jungo',
      //               style: TextStyle(color: Colors.white, fontSize: 18),
      //             ),
      //           ],
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.coffee_maker),
      //         title: Text('Rubik App'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => const CoffeAppScreen()),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      drawer: myDrawer(context, _image?.path, testProvider),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.person, title: 'Profile'),
          TabItem(icon: Icons.exit_to_app_sharp, title: 'Exit'),
        ],
        onTap: (int i) => setState(() {
          index = i;
          if (index == 2) {
            _logout();
          }
        }),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        type: ExpandableFabType.up,
        distance: 50,
        key: _key,
        children: [
          FloatingActionButton.small(
            onPressed: () {
              GlobalValues.banThemeDark.value = false;
            },
            child: const Icon(Icons.light_mode),
          ),
          FloatingActionButton.small(
            heroTag: 20,
            onPressed: () {
              GlobalValues.banThemeDark.value = true;
            },
            child: const Icon(Icons.dark_mode),
          )
        ],
      ),
    );
  }

  void _logout() {
    // Navegar a la pantalla de inicio de sesión
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _showImageOptions() {
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
                _pickImageFromGallery();
              },
            ),
          ],
        );
      },
    );
  }

  Widget myDrawer(
      BuildContext context, String? _image, TestProvider testProvider) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 159, 33, 243),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: _image != null
                      ? FileImage(File(_image))
                      : const AssetImage('assets/elephant_cthulhu_icon.png'),
                  radius: 40,
                ),
                const SizedBox(height: 10),
                FittedBox(
                  child: Text(
                    testProvider.name,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.extension),
            title: const Text('Rubik App'),
            onTap: () {
              Navigator.pop(context);
              Future.delayed(const Duration(milliseconds: 300), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CoffeAppScreen(),
                  ),
                );
              });
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/db');
            },
            title: const Text(
              'Movie List',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('DatabaseMovies'),
            leading: const Icon(Icons.movie),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            title: const Text(
              'Item 2',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Acción cuando se presiona el item
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/preferencesTheme');
            },
            title: const Text(
              'Tema',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Escoger el tema'),
            leading: const Icon(Icons.brightness_6),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/popular'),
            title: const Text('Popular Movies'),
            subtitle: const Text('API of movies'),
            leading: const Icon(Icons.movie),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/maps'),
            title: const Text('Google Maps'),
            subtitle: const Text('Map'),
            leading: const Icon(Icons.map),
            trailing: const Icon(Icons.chevron_right),
          )
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bienvenido Al Home',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.home, size: 50, color: Colors.blue),
        ],
      ),
    );
  }
}



// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Screen'),
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
//         initialActiveIndex: 0,
//         onTap: (int index) {
//           if (index == 2) {
//             // Navega a ProfileScreen cuando se seleccione el icono de perfil
//             Navigator.pushNamed(context, '/profile');
//           } else {
//             print('Tab $index selected');
//           }
//         },
//       ),
//     );
//   }
// }
