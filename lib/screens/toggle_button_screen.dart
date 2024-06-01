import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool switchValue = false;
  bool switchValue2 = false;
  bool switchValue3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('AnimatedToggleSwitch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedToggleSwitch<bool>.size(
              current: switchValue,
              values: const [true, false],
              iconOpacity: 0.2,
              indicatorSize: const Size.fromWidth(100),
              customIconBuilder: (context, local, global) => Text(
                  local.value ? "Android" : "IOS",
                  style: TextStyle(
                      color: Color.lerp(
                          Colors.black, Colors.white, local.animationValue))),
              borderWidth: 5.0,
              iconAnimationType: AnimationType.onHover,
              style: ToggleStyle(
                  indicatorColor: Colors.teal,
                  borderColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    const BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 15))
                  ]),
              selectedIconScale: 1.0,
              onChanged: (value) => setState(() {
                switchValue = value;
              }),
            ),
            const SizedBox(
              height: 50,
            ),
            AnimatedToggleSwitch.dual(
              current: switchValue2,
              first: false,
              second: true,
              spacing: 50,
              style: ToggleStyle(
                  indicatorColor: Colors.teal,
                  borderColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    const BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              borderWidth: 5,
              height: 50,
              onChanged: (value) => setState(() {
                switchValue2 = value;
              }),
              styleBuilder: (value) => ToggleStyle(
                indicatorColor: value ? Colors.red : Colors.green,
              ),
              iconBuilder: (value) => value
                  ? const Icon(Icons.coronavirus_rounded)
                  : const Icon(Icons.tag_faces_rounded),
              textBuilder: (value) => value
                  ? const Center(
                      child: Text("Oh Shit!"),
                    )
                  : const Center(child: Text("Nice")),
            ),
            const SizedBox(
              height: 50,
            ),
            DefaultTextStyle.merge(
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                child: IconTheme(
                    data: const IconThemeData(color: Colors.white),
                    child: AnimatedToggleSwitch.dual(
                      current: switchValue3,
                      first: false,
                      second: true,
                      spacing: 45,
                      animationDuration: const Duration(milliseconds: 600),
                      style: const ToggleStyle(
                          borderColor: Colors.transparent,
                          indicatorColor: Colors.white,
                          backgroundColor: Colors.black),
                      customStyleBuilder: (context, local, global) {
                        if (global.position <= 0) {
                          return ToggleStyle(backgroundColor: Colors.red[800]);
                        }
                        return ToggleStyle(
                            backgroundGradient: LinearGradient(colors: [
                          Colors.green,
                          Colors.red[800]!
                        ], stops: [
                          global.position -
                              (1 - 2 * max(0, global.position - 0.5)) * 0.7,
                          global.position +
                              max(0, 2 * (global.position - 0.5)) * 0.7,
                        ]));
                      },
                      borderWidth: 6,
                      height: 60,
                      loadingIconBuilder: (context, global) =>
                          CupertinoActivityIndicator(
                        color: Color.lerp(
                            Colors.red[800], Colors.green, global.position),
                      ),
                      onChanged: (value) => setState(() {
                        switchValue3 = value;
                      }),
                      iconBuilder: (value) => value
                          ? const Icon(
                              Icons.power_outlined,
                              color: Colors.green,
                              size: 32,
                            )
                          : Icon(
                              Icons.power_settings_new_outlined,
                              color: Colors.red[800],
                              size: 32,
                            ),
                      textBuilder: (value) => value ?
                          const Center(
                            child: Text("Active"),
                          ) : const Center(child: Text("Inactive")),
                    ))),
          ],
        ),
      ),
    );
  }
}
