import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  Duration duration = const Duration();
  Timer? timer;
  bool isPaused = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withBlue(30),
      body: Center(child: buildTimerUI()),
    );
  }

  buildTimerUI() {
    String twoDigit(int value) => value.toString().padLeft(2, "0");
    String seconds = twoDigit(duration.inSeconds.remainder(60));
    String minutes = twoDigit(duration.inMinutes.remainder(60));
    String hours = twoDigit(duration.inHours.remainder(24));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTimerContainer(
              Text(
                hours,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              "Hours"),
          const SizedBox(
            width: 15,
          ),
          buildTimerContainer(
              Text(
                minutes,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              "Minutes"),
          const SizedBox(
            width: 15,
          ),
          buildTimerContainer(
              Text(
                seconds,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              "Seconds")
        ],
      ),
      const SizedBox(height: 30,),
      GestureDetector(
        onTap: (){
          timer = null;
          isPaused = true;
          duration = Duration.zero;
          setState(() {
          });
        },
        child: Container(
          height: 60,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: const Text("Stop",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,),
        )),
      ),
        SizedBox(height:15),
        GestureDetector(
          onTap: (){
            isPaused = !isPaused;
            setState(() {
            });
            if(timer == null) {
              startTimer();
            }
          },
          child: Container(
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                color: isPaused ? Colors.green : Colors.orangeAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child:Text(isPaused ? "Play" : "Pause",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,),
              )),
        )
    ]
    );
  }

  void startTimer() {
    var addSecond = 1;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(!isPaused) {
      addTimer();}
    });
  }

  void addTimer() {
    duration = Duration(seconds: 1 + duration.inSeconds);
    setState(() {});
  }
}

buildTimerContainer(Text text, String s) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: text,
      ),
      const SizedBox(height: 10),
      Text(s, style: const TextStyle(color: Colors.white))
    ],
  );
}
