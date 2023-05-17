import 'package:example/new/vx_browser.dart';
import 'package:example/utils/coolors.dart';
import 'package:example/widgets/draw_android.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class VxDemo extends StatelessWidget {
  const VxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final childHeight = context.mdColumns * (context.isMobile ? 14.0 : 15.0);
    final childWidth = context.mdColumns * (context.isMobile ? 20.0 : 10.0);
    return [
      VxBrowser(
        colorSet: Coolors.colorSet1,
        title: "VxShapes",
        child: [
          Wrap(
            children: [
              VxCircle(
                backgroundColor: Coolors.colorSet1[1],
                radius: childHeight,
              ).shadowSm.p8(),
              VxCapsule(
                backgroundColor: Coolors.colorSet1[1],
                height: childHeight,
                width: childWidth,
              ).shadowXs.p8(),
              VxEllipse(
                backgroundColor: Coolors.colorSet1[1],
                height: childHeight,
                width: childWidth,
              ).shadowXs.p8(),
              VxBevel(
                backgroundColor: Coolors.colorSet1[1],
                radius: 20,
                height: childHeight,
                width: childWidth,
              ).shadowXs.p8(),
              VxContinuousRectangle(
                backgroundColor: Coolors.colorSet1[1],
                radius: 20,
                height: childHeight,
                width: childWidth,
              ).shadowXs.p8(),
              VxTriangle(
                backgroundColor: Coolors.colorSet1[1],
                height: childHeight,
                width: childWidth,
              ).p8(),
              VxTicket(
                backgroundColor: Coolors.colorSet1[1],
                height: childHeight,
                width: childWidth,
              ).p8()
            ],
          ).centered().p16(),
          MadeWithVx(
            color: Coolors.colorSet1[2],
          ),
        ].zStack(),
      ),
      VxBrowser(
        colorSet: Coolors.colorSet2,
        title: "VxAnimator",
        child: [
          DrawAndroid(),
          MadeWithVx(
            color: Coolors.colorSet2[2],
          ),
        ].zStack(),
      ),
      VxBrowser(
        colorSet: Coolors.colorSet3,
        title: "Hello 2021",
        child: [
          "Happy New Year".text.xl6.makeCentered().shimmer(),
          MadeWithVx(
            color: Coolors.colorSet3[2],
          ),
        ].zStack(),
      ),
      VxBrowser(
        colorSet: Coolors.colorSet4,
        title: "Hello 2021",
        child: [
          VxTicket(
            isTwoSided: true,
            backgroundColor: Coolors.colorSet4[1],
            child: "Happy New Year".text.semiBold.xl6.center.makeCentered(),
          ).centered(),
          MadeWithVx(
            color: Coolors.colorSet4[2],
          ),
        ].zStack(),
      ),
      VxBrowser(
        colorSet: Coolors.colorSet5,
        title: "Hello 2021",
        child: [
          VxTicket(
            isHardEdged: true,
            backgroundColor: Coolors.colorSet5[1],
            child: [
              "By Pawan Kumar".text.semiBold.xl4.makeCentered(),
              10.widthBox,
              const FlutterLogo(
                style: FlutterLogoStyle.markOnly,
              ).scale150()
            ].hStack(alignment: MainAxisAlignment.center),
          ).centered(),
          MadeWithVx(
            color: Coolors.colorSet5[2],
          ),
        ].zStack(),
      ),
      VxBrowser(
        colorSet: Coolors.colorSet6,
        title: "Hello 2021",
        child: [
          "Happy New Year".text.xl6.makeCentered().shimmer(),
          MadeWithVx(
            color: Coolors.colorSet6[2],
          ),
        ].zStack(),
      )
    ].vStack().scrollVertical();
  }
}

class MadeWithVx extends StatelessWidget {
  final Color color;

  const MadeWithVx({super.key, required this.color});
  @override
  Widget build(BuildContext context) {
    return "Made With VelocityX"
        .text
        .bold
        .sm
        .white
        .make()
        .p8()
        .box
        .roundedLg
        .neumorphic(
          color: color,
          curve: VxCurve.flat,
          elevation: 10.0,
        )
        .make()
        .positioned(bottom: 10, right: 10);
  }
}
