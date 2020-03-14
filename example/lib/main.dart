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
          .textRed500()
          .text4XL()
          .fontExtraBold()
          .p16()
          .circularCard(color: VelocityX.blueColor100)
          .alignAtCenterLeft(),
    );
  }
}
