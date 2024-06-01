import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  var themeMode = ThemeMode.light;

  void changeThemeMode(ThemeMode mode) {
    themeMode = mode;
    print(themeMode);
    notifyListeners();
  }
}