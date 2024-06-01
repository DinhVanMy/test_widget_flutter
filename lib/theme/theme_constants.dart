import 'package:flutter/material.dart';

const primaryColor = Colors.deepPurple;
const secondaryColor = Colors.purple;

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 20,horizontal: 40)
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
      backgroundColor: MaterialStateProperty.all(secondaryColor)
    ),
  ),
  textTheme: const TextTheme(
    titleSmall: TextStyle(
      color: Colors.black87,
      fontSize: 16
    ),
    titleMedium: TextStyle(
      color: Colors.black87,
      fontSize: 20
    ),
    titleLarge: TextStyle(
      color: Colors.black87,
      fontSize: 24
    )
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: secondaryColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: secondaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 20,horizontal: 40)
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            )
        ),
        backgroundColor: MaterialStateProperty.all(primaryColor)
    ),
  ),
  textTheme: const TextTheme(
      titleSmall: TextStyle(
          color: Colors.white70,
          fontSize: 16
      ),
      titleMedium: TextStyle(
          color: Colors.white70,
          fontSize: 20
      ),
      titleLarge: TextStyle(
          color: Colors.white70,
          fontSize: 24
      )
  ),
);