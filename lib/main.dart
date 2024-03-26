import 'package:flutter/material.dart';

import 'pages/home_page.dart';
// import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
    // DeviceOrientation.portraitUp,
  // ]).then((value) => runApp(MyApp()));
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  var myColorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 151, 184, 211),
        colorScheme: myColorScheme,

        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: myColorScheme.onPrimaryContainer,
          foregroundColor: myColorScheme.onPrimary,
        ),

        cardTheme: const CardTheme().copyWith(
          color: myColorScheme.primaryContainer,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myColorScheme.primaryContainer,
          ),
        ),

        textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
              fontWeight: FontWeight.normal,
              color: myColorScheme.onSecondaryContainer,
              fontSize: 20,
            )),

        bottomSheetTheme: const BottomSheetThemeData().copyWith(
          backgroundColor: myColorScheme.primaryContainer,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
