import 'package:ddd_arch/core/resource/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: AppColors.lightPrimaryColor,
  scaffoldBackgroundColor: AppColors.lightBackgroundColor,
  appBarTheme: AppBarTheme(
    color: AppColors.lightBackgroundColor,
    iconTheme: const IconThemeData(color: AppColors.lightIconColor),
    toolbarTextStyle: _lightTextTheme.bodyMedium,
    titleTextStyle: _lightTextTheme.titleLarge,
  ),
  iconTheme: const IconThemeData(
    color: AppColors.lightIconColor,
  ),
  textTheme: _lightTextTheme,
  dividerTheme: const DividerThemeData(
    color: AppColors.greyColor,
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.blueAccent,
    onPrimary: Colors.white,
    secondary: Colors.lightGreen,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.green,
    onSurface: Colors.greenAccent,
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: AppColors.darkPrimaryColor,
  scaffoldBackgroundColor: AppColors.darkBackgroundColor,
  appBarTheme: AppBarTheme(
    color: AppColors.darkBackgroundColor,
    iconTheme: const IconThemeData(color: AppColors.darkIconColor),
    toolbarTextStyle: _darkTextTheme.bodyMedium,
    titleTextStyle: _darkTextTheme.titleLarge,
  ),
  iconTheme: const IconThemeData(
    color: AppColors.darkIconColor,
  ),
  textTheme: _darkTextTheme,
  dividerTheme: const DividerThemeData(
    color: AppColors.greyColor,
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.redAccent,
    onPrimary: Colors.white,
    secondary: Colors.orange,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    background: Colors.black,
    onBackground: Colors.white,
    surface: Colors.green,
    onSurface: Colors.greenAccent,
  ),
);

TextTheme _lightTextTheme = const TextTheme(
  displayLarge: TextStyle(fontSize: 96, color: AppColors.lightTextColor),
  displayMedium: TextStyle(fontSize: 60, color: AppColors.lightTextColor),
  displaySmall: TextStyle(fontSize: 48, color: AppColors.lightTextColor),
  headlineMedium: TextStyle(fontSize: 34, color: AppColors.lightTextColor),
  headlineSmall: TextStyle(fontSize: 24, color: AppColors.lightTextColor),
  titleLarge: TextStyle(
    fontSize: 20,
    color: AppColors.lightTextColor,
    fontWeight: FontWeight.w500,
  ),
  titleMedium: TextStyle(fontSize: 16, color: AppColors.lightTextColor),
  titleSmall: TextStyle(
    fontSize: 14,
    color: AppColors.lightTextColor,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: TextStyle(fontSize: 16, color: AppColors.lightTextColor),
  bodyMedium: TextStyle(fontSize: 14, color: AppColors.lightTextColor),
  bodySmall: TextStyle(fontSize: 12, color: AppColors.lightTextColor),
  labelLarge: TextStyle(
    fontSize: 14,
    color: AppColors.lightTextColor,
    fontWeight: FontWeight.w500,
  ),
  labelSmall: TextStyle(fontSize: 14, color: AppColors.lightTextColor),
);

TextTheme _darkTextTheme = const TextTheme(
  displayLarge: TextStyle(fontSize: 96, color: AppColors.darkTextColor),
  displayMedium: TextStyle(fontSize: 60, color: AppColors.darkTextColor),
  displaySmall: TextStyle(fontSize: 48, color: AppColors.darkTextColor),
  headlineMedium: TextStyle(fontSize: 34, color: AppColors.darkTextColor),
  headlineSmall: TextStyle(fontSize: 24, color: AppColors.darkTextColor),
  titleLarge: TextStyle(
    fontSize: 20,
    color: AppColors.darkTextColor,
    fontWeight: FontWeight.w500,
  ),
  titleMedium: TextStyle(fontSize: 16, color: AppColors.darkTextColor),
  titleSmall: TextStyle(
    fontSize: 14,
    color: AppColors.darkTextColor,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: TextStyle(fontSize: 16, color: AppColors.darkTextColor),
  bodyMedium: TextStyle(fontSize: 14, color: AppColors.darkTextColor),
  bodySmall: TextStyle(fontSize: 12, color: AppColors.darkTextColor),
  labelLarge: TextStyle(
    fontSize: 14,
    color: AppColors.darkTextColor,
    fontWeight: FontWeight.w500,
  ),
  labelSmall: TextStyle(fontSize: 14, color: AppColors.darkTextColor),
);
