import 'package:ddd_arch/core/resource/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColorLight,
  scaffoldBackgroundColor: AppColors.backgroundColorLight,
  appBarTheme: AppBarTheme(
    color: AppColors.inversePrimaryColorLight,
    iconTheme: const IconThemeData(color: AppColors.iconColorLight),
    toolbarTextStyle: _lightTextTheme.bodyMedium,
    titleTextStyle: _lightTextTheme.titleLarge,
  ),
  iconTheme: const IconThemeData(
    color: AppColors.iconColorLight,
  ),
  textTheme: _lightTextTheme,
  dividerTheme: const DividerThemeData(
    color: AppColors.greyColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.onTertiaryColorLight,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: AppColors.onPrimaryColorDark),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.onPrimaryColorDark,
      ),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    selectionColor: AppColors.primaryColorDark,
    cursorColor: AppColors.onPrimaryColorDark,
    selectionHandleColor: AppColors.transparent,
  ),
  colorScheme: colorSchemeLight,
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryColorDark,
  scaffoldBackgroundColor: AppColors.backgroundColorDark,
  appBarTheme: AppBarTheme(
    color: AppColors.outlineColorLight,
    iconTheme: const IconThemeData(color: AppColors.iconColorDark),
    toolbarTextStyle: _darkTextTheme.bodyMedium,
    titleTextStyle: _darkTextTheme.titleLarge,
  ),
  iconTheme: const IconThemeData(
    color: AppColors.iconColorDark,
  ),
  textTheme: _darkTextTheme,
  dividerTheme: const DividerThemeData(
    color: AppColors.greyColor,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: AppColors.onPrimaryColorLight),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.onPrimaryColorLight,
      ),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    selectionColor: AppColors.primaryColorLight,
    cursorColor: AppColors.onPrimaryColorLight,
    selectionHandleColor: AppColors.transparent,
  ),
  colorScheme: colorSchemeDark,
);

const ColorScheme colorSchemeLight = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.primaryColorLight,
  onPrimary: AppColors.onPrimaryColorLight,
  primaryContainer: AppColors.primaryContainerColorLight,
  onPrimaryContainer: AppColors.onPrimaryContainerColorLight,
  secondary: AppColors.secondaryColorLight,
  onSecondary: AppColors.onSecondaryColorLight,
  secondaryContainer: AppColors.secondaryContainerColorLight,
  onSecondaryContainer: AppColors.onSecondaryContainerColorLight,
  tertiary: AppColors.tertiaryColorLight,
  onTertiary: AppColors.onTertiaryColorLight,
  tertiaryContainer: AppColors.tertiaryContainerColorLight,
  onTertiaryContainer: AppColors.onTertiaryContainerColorLight,
  error: AppColors.errorColorLight,
  onError: AppColors.onErrorColorLight,
  errorContainer: AppColors.errorContainerColorLight,
  onErrorContainer: AppColors.onErrorContainerColorLight,
  background: AppColors.backgroundColorLight,
  onBackground: AppColors.onBackgroundColorLight,
  surface: AppColors.surfaceColorLight,
  onSurface: AppColors.onSurfaceColorLight,
  surfaceVariant: AppColors.surfaceVariantColorLight,
  onSurfaceVariant: AppColors.onSurfaceVariantColorLight,
  outline: AppColors.outlineColorLight,
  shadow: AppColors.shadowColorLight,
  inverseSurface: AppColors.inverseSurfaceColorLight,
  onInverseSurface: AppColors.onInverseSurfaceColorLight,
  inversePrimary: AppColors.inversePrimaryColorLight,
  surfaceTint: AppColors.surfaceTintColorLight,
);
const ColorScheme colorSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.primaryColorDark,
  onPrimary: AppColors.onPrimaryColorDark,
  primaryContainer: AppColors.primaryContainerColorDark,
  onPrimaryContainer: AppColors.onPrimaryContainerColorDark,
  secondary: AppColors.secondaryColorDark,
  onSecondary: AppColors.onSecondaryColorDark,
  secondaryContainer: AppColors.secondaryContainerColorDark,
  onSecondaryContainer: AppColors.onSecondaryContainerColorDark,
  tertiary: AppColors.tertiaryColorDark,
  onTertiary: AppColors.onTertiaryColorDark,
  tertiaryContainer: AppColors.tertiaryContainerColorDark,
  onTertiaryContainer: AppColors.onTertiaryContainerColorDark,
  error: AppColors.errorColorDark,
  onError: AppColors.onErrorColorDark,
  errorContainer: AppColors.errorContainerColorDark,
  onErrorContainer: AppColors.onErrorContainerColorDark,
  background: AppColors.backgroundColorDark,
  onBackground: AppColors.onBackgroundColorDark,
  surface: AppColors.surfaceColorDark,
  onSurface: AppColors.onSurfaceColorDark,
  surfaceVariant: AppColors.surfaceVariantColorDark,
  onSurfaceVariant: AppColors.onSurfaceVariantColorDark,
  outline: AppColors.outlineColorDark,
  shadow: AppColors.shadowColorDark,
  inverseSurface: AppColors.inverseSurfaceColorDark,
  onInverseSurface: AppColors.onInverseSurfaceColorDark,
  inversePrimary: AppColors.inversePrimaryColorDark,
  surfaceTint: AppColors.surfaceTintColorDark,
);

TextTheme _lightTextTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 96.sp, color: AppColors.textColorLight),
  displayMedium: TextStyle(fontSize: 60.sp, color: AppColors.textColorLight),
  displaySmall: TextStyle(fontSize: 48.sp, color: AppColors.textColorLight),
  headlineLarge: TextStyle(fontSize: 42.sp, color: AppColors.textColorLight),
  headlineMedium: TextStyle(fontSize: 34.sp, color: AppColors.textColorLight),
  headlineSmall: TextStyle(fontSize: 24.sp, color: AppColors.textColorLight),
  titleLarge: TextStyle(
    fontSize: 20.sp,
    color: AppColors.textColorLight,
    fontWeight: FontWeight.w500,
  ),
  titleMedium: TextStyle(fontSize: 16.sp, color: AppColors.textColorLight),
  titleSmall: TextStyle(
    fontSize: 14.sp,
    color: AppColors.textColorLight,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: TextStyle(fontSize: 16.sp, color: AppColors.textColorLight),
  bodyMedium: TextStyle(fontSize: 14.sp, color: AppColors.textColorLight),
  bodySmall: TextStyle(fontSize: 12.sp, color: AppColors.textColorLight),
  labelLarge: TextStyle(
    fontSize: 14.sp,
    color: AppColors.textColorLight,
    fontWeight: FontWeight.w500,
  ),
  labelSmall: TextStyle(fontSize: 14.sp, color: AppColors.textColorLight),
);

TextTheme _darkTextTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 96.sp, color: AppColors.textColorDark),
  displayMedium: TextStyle(fontSize: 60.sp, color: AppColors.textColorDark),
  displaySmall: TextStyle(fontSize: 48.sp, color: AppColors.textColorDark),
  headlineMedium: TextStyle(fontSize: 34.sp, color: AppColors.textColorDark),
  headlineSmall: TextStyle(fontSize: 24.sp, color: AppColors.textColorDark),
  titleLarge: TextStyle(
    fontSize: 20.sp,
    color: AppColors.textColorDark,
    fontWeight: FontWeight.w500,
  ),
  titleMedium: TextStyle(fontSize: 16.sp, color: AppColors.textColorDark),
  titleSmall: TextStyle(
    fontSize: 14.sp,
    color: AppColors.textColorDark,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: TextStyle(fontSize: 16.sp, color: AppColors.textColorDark),
  bodyMedium: TextStyle(fontSize: 14.sp, color: AppColors.textColorDark),
  bodySmall: TextStyle(fontSize: 12.sp, color: AppColors.textColorDark),
  labelLarge: TextStyle(
    fontSize: 14.sp,
    color: AppColors.textColorDark,
    fontWeight: FontWeight.w500,
  ),
  labelSmall: TextStyle(fontSize: 14.sp, color: AppColors.textColorDark),
);
