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
      color: VelocityX.teal500,
      child: VelocityDevice(
          mobile: "Mobile"
              .selectableText
              .white
              .xl4
              .semiBold
              .center
              .makeCentered()
              .box
              .rounded
              .teal500
              .neumorphic()
              .make()
              .whHalf(context)
              .centered(),
          web: "Web"
              .text
              .white
              .xl4
              .bold
              .center
              .makeCentered()
              .box
              .rounded
              .teal500
              .neumorphic()
              .make()
              .whHalf(context)
              .centered()),
    );
  }
}
