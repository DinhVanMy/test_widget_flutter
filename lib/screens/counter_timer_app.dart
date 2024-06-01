import 'dart:async';

import 'package:flutter/material.dart';

class CounterTimerScreen extends StatefulWidget {
  const CounterTimerScreen({super.key});

  @override
  State<CounterTimerScreen> createState() => _CounterTimerScreenState();
}

class _CounterTimerScreenState extends State<CounterTimerScreen> {
  Timer? timer;
  int maxSecond = 60;
  int currentSecond = 60;
  bool isPaused = true;
  bool isStopped = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withBlue(30),
      body: Center(
        child: buildUI(),
      ),
    );
  }

  buildUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
          SizedBox(
            height: 200,
            width: 200,
            child:  Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: Text(
                    currentSecond.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                CircularProgressIndicator(
                  value: currentSecond/maxSecond,
                  strokeWidth: 5,
                  color: isPaused ? Colors.orange: Colors.redAccent,
                  backgroundColor: Colors.grey,
                )
              ],
            ),
          ),

        const SizedBox(
          height: 25,
        ),
        isStopped ? ElevatedButton(
            onPressed: () {
              isStopped = false;
              isPaused = false;
              setState(() {
              });
              startTimer();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15)
            ),
            child: const Text(
              "Start",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            )) : Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  stopTimer();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15)
                ),
                child: const Text(
                  "Stop",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            ElevatedButton(
                onPressed: () {
                  isPaused = !isPaused;
                  setState(() {
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: isPaused ? Colors.green : Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15)
                ),
                child: Text(
                  isPaused ? "Continue" : "Pause",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ))
          ],
        )
      ],
    );
  }

  void startTimer(){
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(currentSecond > 0 && !isPaused){
        currentSecond--;
        setState(() {});
      }
    });
  }

  void stopTimer(){
    timer?.cancel();
    timer = null;
    isPaused = true;
    isStopped = true;
    currentSecond = 60;
    setState(() {
    });
  }
}
