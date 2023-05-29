import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class VxShapes extends StatelessWidget {
  const VxShapes({super.key});

  @override
  Widget build(BuildContext context) {
    return VStack([
      const VxTicket(
        width: 200,
        height: 70,
        isTwoSided: true,
        backgroundColor: Colors.pink,
      ),
      "New Shape"
          .text
          .center
          .white
          .xs
          .bold
          .makeCentered()
          .triangle(height: 140, width: 180, backgroundColor: Vx.indigo700),
      10.heightBox,
      VxCircle(
        radius: 120,
        backgroundColor: Colors.blue,
      ).shadow,
      10.heightBox,
      VxEllipse(
        width: 200,
        height: 50,
        backgroundColor: Colors.green,
      ).shadow,
      10.heightBox,
      VxCapsule(
        width: 200,
        height: 50,
        backgroundColor: Colors.red,
      ).shadow,
      10.heightBox,
      VxBevel(
        width: 200,
        height: 50,
        backgroundColor: Colors.orange,
      ).shadow,
      10.heightBox,
      VxContinuousRectangle(
        width: 200,
        height: 50,
        backgroundColor: Colors.indigo,
      ).shadow4xl,
      10.heightBox,
    ]);
  }
}
