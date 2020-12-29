import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class VxShapes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VStack([
      const VxTicket(
        width: 150,
        height: 70,
        isTwoSided: true,
        backgroundColor: Colors.pink,
      ),
      "New Shape"
          .text
          .white
          .xs
          .bold
          .makeCentered()
          .triangle(height: 120, width: 180, backgroundColor: Vx.indigo700),
      10.heightBox,
      VxEllipse(
        width: 100,
        height: 50,
        backgroundColor: Colors.green,
      ).shadow,
      10.heightBox,
      VxCapsule(
        width: 100,
        height: 50,
        backgroundColor: Colors.red,
      ).shadow,
      10.heightBox,
      VxBevel(
        width: 100,
        height: 50,
        backgroundColor: Colors.orange,
      ).shadow,
      10.heightBox,
      VxContinuousRectangle(
        width: 100,
        height: 50,
        backgroundColor: Colors.indigo,
      ).shadow4xl,
      10.heightBox,
    ]);
  }
}
