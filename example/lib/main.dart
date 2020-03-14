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
      child: Row(
        children: <Widget>[
          const Text("Velocity X")
              .textRed400()
              .p8()
              .whHalf(context: context)
              .rounded(backgroundColor: VelocityX.tealColor800)
              .h48(context: context)
        ],
      ).px32(),
    );
  }
}
