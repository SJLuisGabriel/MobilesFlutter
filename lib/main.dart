//cupeapp - para crear estructura inicial para IOS
//mateapp - para crear estructura inicial para Android
import 'package:flutter/material.dart';
import 'package:progmsn2024/provider/test_provider.dart';
import 'package:progmsn2024/screens/detail_popular_screen.dart';
import 'package:progmsn2024/screens/favorites_popular.dart';
import 'package:progmsn2024/screens/maps.screen.dart';
import 'package:progmsn2024/screens/movies_firebase_screen.dart';
import 'package:progmsn2024/screens/popular_screen.dart';
import 'package:progmsn2024/screens/register_screen.dart';
import 'package:progmsn2024/screens/theme_preference.dart';
import 'package:progmsn2024/settings/theme_notifier.dart';
import 'package:progmsn2024/screens/Onboarding/onboarding1.dart';
import 'package:progmsn2024/screens/Onboarding/onboarding2.dart';
import 'package:progmsn2024/screens/Onboarding/onboarding3.dart';
import 'package:progmsn2024/screens/coffe_app_screen.dart';
import 'package:progmsn2024/screens/home_screen.dart';
import 'package:progmsn2024/screens/login_screen.dart';
import 'package:progmsn2024/screens/movides_screen.dart';
import 'package:progmsn2024/screens/profile_screen.dart';
import 'package:progmsn2024/network/popular_api.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeNotifier themeNotifier = ThemeNotifier();

  @override
  Widget build(BuildContext context) {
    PopularApi().getPopularMovies();

    return ValueListenableBuilder<ThemeData>(
      valueListenable: themeNotifier,
      builder: (context, theme, child) {
        return ChangeNotifierProvider(
          create: (context) => TestProvider(),
          child: MaterialApp(
            theme: theme,
            title: 'Programación Móviles',
            home: const LoginScreen(),
            // home: const MoviesFirebaseScreen(),
            routes: {
              '/home': (context) => const HomeScreen(),
              '/profile': (context) => const ProfileScreen(),
              '/db': (context) => const MoviesScreen(),
              '/login': (context) => const LoginScreen(),
              '/onboarding1': (context) => const OnboardingScreen1(),
              '/onboarding2': (context) =>
                  OnboardingScreen2(themeNotifier: themeNotifier),
              '/onboarding3': (context) => const OnboardingScreen3(),
              '/preferencesTheme': (context) =>
                  PreferencesScreen(themeNotifier: themeNotifier),
              '/popular': (context) => const PopularScreen(),
              '/details': (context) => const DetailPopularScreen(),
              '/register': (context) => const RegisterScreen(),
              '/favorites': (context) => const FavoritesPopular(),
              '/maps': (context) => const MapSample(),
            },
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
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
