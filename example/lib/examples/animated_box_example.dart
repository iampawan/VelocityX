import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AnimatedBoxExample extends StatefulWidget {
  const AnimatedBoxExample({super.key});

  @override
  AnimatedBoxExampleState createState() => AnimatedBoxExampleState();
}

class AnimatedBoxExampleState extends State<AnimatedBoxExample> {
  double? _width, _height, _radius;
  Color? _color;

  @override
  void initState() {
    super.initState();

    Timer.periodic(2.seconds, (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();

    // Generate a random width and height.
    _width = random.nextInt(300).toDouble();
    _height = random.nextInt(300).toDouble();

    // Generate a random color.
    _color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );

    // Generate a random border radius.
    _radius = random.nextInt(100).toDouble();
    return VxAnimatedBox()
        .seconds(sec: 2)
        .fastOutSlowIn
        .width(_width! + 50)
        .height(_height!)
        .color(_color!)
        .withRounded(value: _radius!)
        .p16
        .alignCenter
        .make()
        .py16();
  }
}
