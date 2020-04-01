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
      child: VStack(
        [
          VelocityDevice(
              mobile: "Mobile"
                  .text
                  .textStyle(context.textTheme.caption)
                  .italic
                  .center
                  .make()
                  .centered()
                  .box
                  .rounded
                  .teal500
                  .neumorphic()
                  .make()
                  .whHalf(context),
              web: "Web".text.white.xl4.bold.center.makeCentered().animatedBox.bounceIn.rounded.teal500.neumorphic().make().whHalf(context)),
          20.heightBox,
          "Velocity".richText.withTextSpanChildren(["X".textSpan.red400.make()]).xl4.white.make()
        ],
        alignment: MainAxisAlignment.center,
        crossAlignment: CrossAxisAlignment.center,
      ).p16().scrollVertical(),
    );
  }
}
