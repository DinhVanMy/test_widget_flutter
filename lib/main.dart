import 'package:flutter/material.dart';
import 'package:test_app_flutter/screens/liquid_swipe_intro.dart';
import 'package:test_app_flutter/screens/meme_display_screen.dart';
import 'package:test_app_flutter/screens/qr_scanner_screen.dart';
import 'package:test_app_flutter/screens/slidable_screen.dart';
import 'package:test_app_flutter/screens/theme_screen.dart';
import 'package:test_app_flutter/theme/theme_constants.dart';
import 'package:test_app_flutter/theme/theme_manager.dart';

void main(){
  runApp(const MyApp());
}
ThemeManager _themeManager = ThemeManager();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeData,
      title: "Flutter Demo",

      home: const MyHomePage(title:"Flutter Demo Home Page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const LiquidSwipeIntro();
  }
}



