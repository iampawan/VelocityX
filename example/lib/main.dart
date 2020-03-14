import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(MaterialApp(
      home: Demo(),
      debugShowCheckedModeBanner: false,
    ));

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: const Text("Hello World")
          .textBlack()
          .text4XL()
          .fontExtraBold()
          .p16()
          .lGradient(
            colors: [VelocityX.blueColor200, VelocityX.blueColor500],
            rs: RoundedShape.SM,
          )
          // .roundedSM(backgroundColor: VelocityX.blueColor500)
          .shadow2XL()
          .centered(),
    );
  }
}
