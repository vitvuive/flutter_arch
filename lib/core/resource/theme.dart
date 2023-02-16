import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.redAccent,
    onPrimary: Colors.red,
    secondary: Colors.orange,
    onSecondary: Colors.orangeAccent,
    error: Colors.green,
    onError: Colors.purple,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.green,
    onSurface: Colors.greenAccent,
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.redAccent,
    onPrimary: Colors.red,
    secondary: Colors.orange,
    onSecondary: Colors.orangeAccent,
    error: Colors.green,
    onError: Colors.purple,
    background: Colors.black,
    onBackground: Colors.white,
    surface: Colors.green,
    onSurface: Colors.greenAccent,
  ),
);
