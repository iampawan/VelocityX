import 'dart:math';

import 'package:flutter/material.dart';

mixin _RandomColor {
  static final Random _random = Random();

  /// Returns a random color.
  static Color next() {
    return Color(0xFF000000 + _random.nextInt(0x00FFFFFF));
  }
}

/// A Container Widget that takes up a given [width] and [height] and paints itself with a
/// random color.
class VxRandomBox extends StatefulWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final bool changeOnRedraw;

  const VxRandomBox(
      {super.key,
      this.width,
      this.height,
      this.child,
      this.changeOnRedraw = true});

  @override
  VxRandomBoxState createState() => VxRandomBoxState();
}

class VxRandomBoxState extends State<VxRandomBox> {
  Color? _randomColor;

  @override
  void initState() {
    super.initState();
    _randomColor = _RandomColor.next();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.changeOnRedraw == true ? _RandomColor.next() : _randomColor,
      child: widget.child,
    );
  }
}

///Random Color box extension method
extension VxRandomContainerWidgetExtension on Widget {
  VxRandomBox randomBox(
          {double? width, double? height, bool changeOnRedraw = true}) =>
      VxRandomBox(
        height: height,
        width: width,
        changeOnRedraw: changeOnRedraw,
        child: this,
      );
}
