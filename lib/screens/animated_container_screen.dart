import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  // Properties for the animated container
  double containerSize = 100.0;
  Color containerColor = Colors.blue;
  BorderRadiusGeometry borderRadius = BorderRadius.circular(8.0);

  // Function to change container properties randomly
  void _changeContainerProperties() {
    setState(() {
      containerSize = Random().nextDouble() * 200 + 50; // Random size between 50 and 250
      containerColor = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1.0,
      ); // Random color
      borderRadius = BorderRadius.circular(Random().nextDouble() * 100); // Random border radius
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Container(
          height: 80.0,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          child: AppBar(
            title: Center(child: Text('Rounded AppBar')),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _changeContainerProperties,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: containerSize,
            height: containerSize,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: borderRadius,
            ),
            child: const Center(
              child: Text(
                'Tap me!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}