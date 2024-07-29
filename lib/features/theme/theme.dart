import 'package:flutter/material.dart';

final customDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.black,
  ),
);

final customLightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: Colors.white,
  primaryTextTheme: TextTheme(
    titleLarge: TextStyle(
      color: Colors.black,
    ),
  ),
);
