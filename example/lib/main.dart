import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(MaterialApp(home: Demo()));

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(window.physicalSize);
    return Material(
        color: VelocityX.hexToColor("#f7fafc"),
        child: Column(
          children: <Widget>[
            Container(
              child: const Text(
                "Hi",
                style: TextStyle(fontStyle: FontStyle.italic),
              ).textTeal800().fontExtraBold().text6XL(),
            ).bgRed500().shadow().wh20(context: context).p4().opacity25(),
            10.hBox(),
            Container(
              child: const Text(
                "Hi",
                style: TextStyle(fontStyle: FontStyle.italic),
              ).textTeal800().fontExtraBold().text6XL(),
            )
                .rounded(backgroundColor: Colors.white)
                .shadowLG()
                .whOneForth(context: context)
          ],
        ));
  }
}
