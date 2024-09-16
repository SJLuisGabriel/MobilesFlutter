import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:progmsn2024/screens/coffe_app_screen.dart';
import 'package:progmsn2024/screens/profile_screen.dart';
import 'package:progmsn2024/settings/colors_settings.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:progmsn2024/settings/global_values.dart';

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
                  backgroundImage:
                      _image != null ? Image.network(_image!.path).image : null,
                  child: _image == null
                      ? Image.asset("assets/elephant_cthulhu_icon.png")
                      : null,
                ),
              )),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: _image != null
                        ? Image.network(_image!.path).image
                        : const AssetImage('assets/elephant_cthulhu_icon.png'),
                    radius: 40,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Luis Gabriel Sanchez Jungo',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.coffee_maker),
              title: Text('Coffee App'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CoffeAppScreen()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.person, title: 'Profile'),
          TabItem(icon: Icons.exit_to_app_sharp, title: 'Exit'),
        ],
        onTap: (int i) => setState(() {
          index = i;
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
            onPressed: () {
              GlobalValues.banThemeDark.value = true;
            },
            child: const Icon(Icons.dark_mode),
          )
        ],
      ),
    );
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
