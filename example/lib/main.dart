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
        20.hBox,
        "hello world"
            .text
            .red900
            .bold
            .xl
            .build()
            .p16
            .card
            .color(Colors.white)
            .elevation(5)
            .build()
            .p32,
        20.hBox,
        "hello pk"
            .text
            .white
            .bold
            .xl
            .build()
            .p32
            .box
            .roundedLg
            .linearGradient([Colors.indigo, Colors.purple])
            .shadow2xl
            .alignCenter
            .build()
            .whOneForth(context)
      ],
    ));
  }
}
