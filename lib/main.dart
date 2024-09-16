//cupeapp - para crear estructura inicial para IOS
//mateapp - para crear estructura inicial para Android

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:progmsn2024/screens/home_screen.dart';
import 'package:progmsn2024/screens/login_screen.dart';
import 'package:progmsn2024/screens/profile_screen.dart';
import 'package:progmsn2024/settings/global_values.dart';
import 'package:progmsn2024/settings/theme_settings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: GlobalValues.banThemeDark,
        builder: (context, value, Widget) {
          return MaterialApp(
            // theme: Themesettings.darkTheme(),
            theme:
                value ? Themesettings.darkTheme() : Themesettings.lightTheme(),
            title: 'Material App',
            home: LoginScreen(),
            routes: {
              '/home': (context) => HomeScreen(),
              '/profile': (context) => ProfileScreen(),
            },
            debugShowCheckedModeBanner: false,
          );
        });
  }
}

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   // {super.key} es un parametro nombrado
//   MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int contador = 0;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Mi primer APP',
//           style: TextStyle(color: Colors.redAccent),
//         ),
//         backgroundColor: Colors.blueAccent.shade100,
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         color: Colors.grey,
//         child: Center(
//           child: Text(
//             'Contador de Clics: $contador',
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.ads_click_sharp),
//           onPressed: () {
//             contador++;
//             setState(() {});
//             print(contador);
//           }),
//     ));
//   }
// }


// class MyApp extends StatelessWidget {
//   // {super.key} es un parametro nombrado
//   MyApp({super.key});
//   int contador = 10;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Mi primer APP',
//           style: TextStyle(color: Colors.redAccent),
//         ),
//         backgroundColor: Colors.blueAccent.shade100,
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         color: Colors.grey,
//         child: Center(
//           child: Text(
//             'Contador de Clics: $contador',
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.ads_click_sharp),
//           onPressed: () {
//             contador++;
//             print(contador);
//           }),
//     ));
//   }
// }
