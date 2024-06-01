import 'package:flutter/material.dart';
import 'package:test_app_flutter/provider/configs/colors.dart';


var lightTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.5,
    ),
    color: Colors.deepPurple,
    centerTitle: true,
  ),
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: lightBgColor,
    onBackground: lightFontColor,
    primaryContainer: lightContainer,
    primary: lightPrimary,
  ),
);
var darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: darkBgColor,
    onBackground: darkFontColor,
    primaryContainer: darkContainer,
    primary: darkPrimary,
  ),
);