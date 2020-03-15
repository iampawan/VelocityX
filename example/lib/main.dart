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
      child: Column(
        children: <Widget>[
          ...[
            "Hi Pawan"
                .text()
                .p8()
                .rounded(bgColor: VelocityX.pinkColor700)
                .shadowLG()
                .rotate90()
                .p(10),
            "Hi Pawan".text().p8().rounded(bgColor: VelocityX.greenColor400),
            "Hi Pawan".text(),
            "Hi Pawan".text(),
          ]
        ],
      ).p8(),
    );
  }
}
