import 'package:flutter/material.dart';

ThemeData darktheme = ThemeData(
  primaryColor: Colors.deepPurpleAccent.shade200,
  useMaterial3: true,
  brightness: Brightness.dark,
  cardColor: const Color.fromRGBO(30, 30, 30, 1),
  scaffoldBackgroundColor: const Color.fromRGBO(18, 18, 18, 1),
  navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Color.fromRGBO(30, 30, 30, 1),
      indicatorColor: Color.fromRGBO(56, 56, 56, 1),
      iconTheme: WidgetStatePropertyAll(IconThemeData(color: Colors.white70)),
      labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white70))),
);
