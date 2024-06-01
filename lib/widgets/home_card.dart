import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final Color switchColor;
  final String location;

  const HomeCard(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.switchColor,
      required this.location});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool switchValue = false;
  bool animateCards = false;

  @override
  void didUpdateWidget(covariant oldWidget) {
    if(oldWidget.location != widget.location){
      setState(() {
        animateCards = true;
      });
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          animateCards = false;
        });
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      height: animateCards ? width * 0.435 :width * 0.46,
      width:  animateCards ? width * 0.435 : width * 0.46,
      duration: const Duration(milliseconds: 100),
      child: Card(

        color: switchValue ? Colors.white : Colors.white.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: widget.title + '\n',
                    style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                  TextSpan(
                    text: widget.location,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Switch(
                    value: switchValue,
                    activeColor: widget.switchColor,
                    onChanged: (value){
                      setState(() {
                        switchValue = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image.asset(
                    widget.imagePath,
                    height: 100,
                    width: 100,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
