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
        20.heightBox,
        const Text(
          "hello world",
          style: TextStyle(color: Colors.white),
        ).text.bold.xl.make().p16.card.blue500.elevation(5).make().p32,
        20.heightBox,
        "hello world"
            .text
            .white
            .bold
            .xl
            .make()
            .box
            .p16
            .roundedLg
            .linearGradient([Colors.indigo, Colors.purple])
            .shadow2xl
            .make()
      ],
    ));
  }
}
