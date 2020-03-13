import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(MaterialApp(home: Demo()));

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(window.physicalSize);
    return const Material(
      child: VelocityZeroListSkeleton(
        isDark: false,
      ),
    );
  }
}
