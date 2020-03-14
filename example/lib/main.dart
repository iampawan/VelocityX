import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(MaterialApp(home: Demo()));

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(window.physicalSize);
    return Material(
      child: Container(
        height: 100,
        width: 100,
        child: const Text(
          "Hi",
          style: TextStyle(fontSize: 20),
        ).textTeal800(),
      ).bgYellow300().p32().centered(),
    );
  }
}
