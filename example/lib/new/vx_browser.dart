import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class VxBrowser extends StatelessWidget {
  final List<Color> colorSet;
  final String title;
  final Widget? child;

  const VxBrowser(
      {super.key, required this.colorSet, this.title = "VxShapes", this.child});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: colorSet[0],
      child: VStack(
        [
          HStack(
            [
              20.widthBox,
              HStack(3
                  .range
                  .map((e) =>
                      VxCircle(backgroundColor: colorSet[2], radius: 20.0)
                          .shadowSm
                          .px8())
                  .toList()),
              20.widthBox,
              VxBox(child: title.text.bold.center.make().p8())
                  .alignCenter
                  .width(context.percentWidth * (context.isMobile ? 30 : 15))
                  .height(context.percentHeight * 6.5)
                  .withDecoration(BoxDecoration(
                      color: colorSet[1],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))))
                  .make()
                  .objectBottomCenter(),
              20.widthBox,
              Icon(Icons.add, size: 30.0, color: colorSet[1])
                  .offset(offset: const Offset(0, 5))
            ],
            axisSize: MainAxisSize.max,
          ).box.color(Colors.white).make().h8(context),
          HStack(
            [
              HStack([
                Icon(Icons.arrow_left_rounded, size: 80.0, color: colorSet[2]),
                Icon(Icons.arrow_right_rounded, size: 80.0, color: colorSet[2])
              ]),
              VxCapsule(
                height: 50.0,
                backgroundColor: Colors.white,
                child: "https://velocityx.dev"
                    .text
                    .wide
                    .semiBold
                    .color(colorSet[2].withGreen(100))
                    .make()
                    .objectCenterLeft()
                    .px16(),
              ).expand(),
              20.widthBox,
            ],
            axisSize: MainAxisSize.max,
          ).box.color(colorSet[1]).make().h(context.percentHeight * 12),
          VxBox(child: child)
              .color(colorSet[2])
              .make()
              .wFull(context)
              .h56(context)
        ],
      ).p(context.isMobile ? 20 : context.percentHeight * 12),
    );
  }
}
