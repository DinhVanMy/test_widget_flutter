import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class ChangeThemePage extends StatelessWidget {
  const ChangeThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("CHANGE THEME"),
      ),
      body: Center(child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return value.themeMode == ThemeMode.light
              ? IconButton(
            onPressed: () {
              themeProvider.changeThemeMode(ThemeMode.dark);
            },
            icon: Icon(
              Icons.dark_mode,
              size: 50,
              color: Colors.deepPurple,
            ),
          )
              : IconButton(
            onPressed: () {
              themeProvider.changeThemeMode(ThemeMode.light);
            },
            icon: Icon(
              Icons.sunny,
              size: 50,
              color: Colors.deepPurple,
            ),
          );
        },
      )),
    );
  }
}