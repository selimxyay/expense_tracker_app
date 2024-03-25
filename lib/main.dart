import 'package:flutter/material.dart';

import 'pages/home_page.dart';

/* 
expenses.dart = home_page.dart
expense.dart = expense_model.dart
expensesItem.dart = expenses_container.dart
new_expense.dart = add_expense.dart
*/

void main() {
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

        // appBar theme
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: myColorScheme.onPrimaryContainer,
          foregroundColor: myColorScheme.onPrimary,
        ),

        // card theme
        cardTheme: const CardTheme().copyWith(
          color: myColorScheme.primaryContainer,
        ),

        // elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myColorScheme.primaryContainer,
          ),
        ),

        // text theme
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
