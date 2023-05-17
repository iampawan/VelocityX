import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class VxAnimationExample extends StatefulWidget {
  const VxAnimationExample({super.key});

  @override
  VxAnimationExampleState createState() => VxAnimationExampleState();
}

class VxAnimationExampleState extends State<VxAnimationExample>
    with SingleTickerProviderStateMixin {
  num anim = 1.0;

  @override
  void initState() {
    super.initState();

    withRepeatAnimation(
      vsync: this,
      tween: Tween(begin: 0.2, end: 2.0),
      duration: 5.seconds,
      isRepeatReversed: true,
      callBack: (value, percent) {
        anim = value as num;
        setState(() {});
        // print(anim);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return "Animated Text"
        .text
        .semiBold
        .center
        .makeCentered()
        .scale(scaleValue: anim as double)
        .p16();
  }
}
