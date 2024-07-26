import 'package:flutter/material.dart';

//both theme
const startColor = Colors.amber;
const activeBorder = Colors.red;

// dark theme
const mainDark = Colors.black;
const backgrounDark = Colors.grey;

// light theme
const mainLight = Colors.white;
const secondaryLight = Colors.grey;
const backgroundLight = Colors.amber;
const mainColorDark = Colors.black;

final customDarkTheme = ThemeData.dark().copyWith(
  primaryColor: mainDark,
  appBarTheme: const AppBarTheme(
    backgroundColor: backgrounDark,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: backgrounDark,
    foregroundColor: Colors.white,
  ),
  dividerTheme: const DividerThemeData(
    color: Colors.transparent,
  ),
);

final customLightTheme = ThemeData.light().copyWith(
  primaryColor: mainLight,
  primaryColorDark: mainColorDark,
  primaryColorLight: secondaryLight,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: mainLight,
    onPrimary: backgroundLight,
    secondary: mainDark,
    onSecondary: startColor,
    error: Colors.red,
    onError: Colors.red,
    surface: backgroundLight,
    onSurface: backgroundLight,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: backgroundLight,
    titleTextStyle: TextStyle(
      fontSize: 32,
      color: mainColorDark,
      fontWeight: FontWeight.w600,
    ),
  ),
  expansionTileTheme: const ExpansionTileThemeData(
    collapsedTextColor: mainColorDark,
    textColor: secondaryLight,
    collapsedIconColor: mainColorDark,
    iconColor: secondaryLight,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: backgroundLight,
    foregroundColor: mainLight,
  ),
  dividerTheme: const DividerThemeData(
    color: Colors.transparent,
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: mainColorDark,
    inactiveTrackColor: mainLight,
    thumbColor: mainColorDark,
  ),
  textTheme: const TextTheme(
    titleSmall: TextStyle(
      color: mainColorDark,
    ),
    titleMedium: TextStyle(
      color: mainColorDark,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: mainColorDark,
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: mainColorDark,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),
  iconTheme: const IconThemeData(
    color: mainColorDark,
  ),
);
