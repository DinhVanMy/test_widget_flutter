import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:test_app_flutter/screens/master_intro_screen.dart';

class LiquidSwipeIntro extends StatefulWidget {
  const LiquidSwipeIntro({super.key});

  static final style = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  @override
  State<LiquidSwipeIntro> createState() => _LiquidSwipeIntroState();
}

class _LiquidSwipeIntroState extends State<LiquidSwipeIntro> {
  int page = 0;
  late LiquidController liquidController;
  late UpdateType updateType;
  final pages = [
    const MasterIntroScreen(
        backgroundColor: Colors.blue,
        text1: "Hi",
        text2: "This is",
        text3: "Dinh Van My"),
    const MasterIntroScreen(
        backgroundColor: Colors.deepPurple,
        text1: "Hi",
        text2: "This is",
        text3: "Dinh Van My"),
    const MasterIntroScreen(
        backgroundColor: Colors.green,
        text1: "Hi",
        text2: "This is",
        text3: "Dinh Van My"),
  ];

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  Widget _buildDot(int index){
    double selectedNess =Curves.easeOut.transform(
      max(0.0, 1.0 - ((page) - index).abs())
    );

    double zoom = 1.0 + (1.0) * selectedNess;

    return Container(

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
              pages: pages,
            positionSlideIcon: 0.8,  // Position of the slide icon on the screen.
            slideIconWidget: const Icon(Icons.arrow_back_ios),  // Widget used as the slide icon.
            onPageChangeCallback: pageChangeCallback,  // Callback function when the page changes.
            waveType: WaveType.liquidReveal,  // Type of wave animation.
            liquidController: liquidController,  // Controller for the LiquidSwipe widget.
            fullTransitionValue: 880,  // Value for full transition of the swipe animation.
            enableSideReveal: true,  // Enables the side reveal effect.
            preferDragFromRevealedArea: true,  // Allows dragging from the revealed area.
            enableLoop: true,  // Enables looping through the pages.
            ignoreUserGestureWhileAnimating: true,  // Ignores user gestures while animating.
          )
        ],
      ),
    );
  }

  void pageChangeCallback(int activePageIndex) {
    setState(() {
      page = activePageIndex;
    });
  }
}
