import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:progmsn2024/screens/profile_screen.dart';
import 'package:progmsn2024/settings/colors_settings.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:progmsn2024/settings/global_values.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final _key = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsSettings.navColor,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.access_alarm_outlined)),
          GestureDetector(
              onTap: () {},
              child: MouseRegion(
                cursor: MouseCursor.defer,
                child: Image.asset("assets/elephant_cthulhu_icon.png"),
              ))
        ],
      ),
      body: Builder(builder: (context) {
        switch (index) {
          case 1:
            return ProfileScreen();

          default:
            return ProfileScreen();
        }
      }),
      drawer: Drawer(),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.person, title: 'Profile'),
          TabItem(icon: Icons.exit_to_app_sharp, title: 'Exit'),
        ],
        onTap: (int i) => setState(() {
          index = i;
          print(index);
          // if (index == 1) {
          //   Navigator.pushNamed(context, '/profile');
          // }
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
            child: Icon(Icons.light_mode),
          ),
          FloatingActionButton.small(
            onPressed: () {
              GlobalValues.banThemeDark.value = true;
            },
            child: Icon(Icons.dark_mode),
          )
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
