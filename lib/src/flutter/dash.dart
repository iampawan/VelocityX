import 'package:flutter/material.dart';

///
/// VelocityX widget to show Dashes with gaps if needed. It can be vertical or horizontal.
///
class VxDash extends StatelessWidget {
  const VxDash(
      {super.key,
      this.direction = Axis.horizontal,
      this.dashColor = Colors.black,
      this.length = 200,
      this.dashGap = 3,
      this.dashLength = 6,
      this.dashThickness = 1,
      this.dashBorderRadius = 0});

  /// Direction of the dash. Default is horizontal
  final Axis direction;

  /// Color of the dash. Default is black
  final Color dashColor;

  /// Total length. Default is 200
  final double length;

  /// Gap between the dashes. Default is 3px
  final double dashGap;

  /// Length of the dash. Default is 6
  final double dashLength;

  /// Thinkness of the dash. Default is 1
  final double dashThickness;

  /// Border radius of the dash. Default is 0
  final double dashBorderRadius;

  @override
  Widget build(BuildContext context) {
    final dashes = <Widget>[];
    final double n = (length + dashGap) / (dashGap + dashLength);
    final int newN = n.round();
    final double newDashGap = (length - dashLength * newN) / (newN - 1);
    for (var i = newN; i > 0; i--) {
      dashes.add(step(i, newDashGap));
    }
    if (direction == Axis.horizontal) {
      return SizedBox(
          width: length,
          child: Row(
            children: dashes,
          ));
    } else {
      return Column(children: dashes);
    }
  }

  /// Method to create step
  Widget step(int index, double newDashGap) {
    final bool isHorizontal = direction == Axis.horizontal;
    return Padding(
        padding: EdgeInsets.fromLTRB(
            0,
            0,
            isHorizontal && index != 1 ? newDashGap : 0,
            isHorizontal || index == 1 ? 0 : newDashGap),
        child: SizedBox(
          width: isHorizontal ? dashLength : dashThickness,
          height: isHorizontal ? dashThickness : dashLength,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: dashColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(dashBorderRadius))),
          ),
        ));
  }
}
