import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DrawAndroid extends StatelessWidget {
  final _androidColor = Vx.hexToColor("#30D780");

  DrawAndroid({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            VxContinuousRectangle(
              height: 10.0,
              width: 50.0,
              backgroundColor: _androidColor,
            ).rotate60(),
            VxContinuousRectangle(
              height: 10.0,
              width: 50.0,
              backgroundColor: _androidColor,
            ).rotateN60(),
          ],
        ).px(70),
        VxCircle(
          radius: 200,
          backgroundColor: _androidColor,
          child: [
            VxCircle(
              backgroundColor: Colors.white,
              radius: 22.0,
            ).shadow,
            60.widthBox,
            VxCircle(
              backgroundColor: Colors.white,
              radius: 22.0,
            ).shadow,
          ]
              .hStack(
                  alignment: MainAxisAlignment.center,
                  crossAlignment: CrossAxisAlignment.start)
              .offset(offset: const Offset(0, 50.0)),
        ).clipHalf(),
        VxCapsule().clipHalf()
      ],
    );
  }
}
