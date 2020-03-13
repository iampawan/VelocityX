import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(MaterialApp(home: Demo()));

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(window.physicalSize);
    return Material(
      child: Center(
          child: Column(
        children: <Widget>[
          Text("${context.nav}"),
          Text("${context.percentWidth * 50}"),
          Text("${context.mdResponsive.columns}"),
          Text("${context.mdResponsive.gutter}"),
          Text("${context.mdResponsive.deviceInfo.deviceType}"),
          Text("${context.mdResponsive.deviceInfo.deviceSize}"),
          Text("${context.mdResponsive.windowSize}"),
        ],
      )),
    );
  }
}
