import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MasterIntroScreen extends StatelessWidget {
  final Color backgroundColor;
  final String text1;
  final String text2;
  final String text3;

  const MasterIntroScreen(
      {super.key,
      required this.backgroundColor,
      required this.text1,
      required this.text2,
      required this.text3});

  static final style = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset("assets/icons/fan.png",fit: BoxFit.cover,),
          const Padding(padding: EdgeInsets.all(24)),
          Column(
            children: [
              Text(text1,style: style,),
              Text(text2, style: style,),
              Text(text3, style: style,),
            ],
          )
        ],
      ),
    );
  }
}
