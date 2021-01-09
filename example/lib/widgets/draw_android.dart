import 'package:example/utils/coolors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DrawAndroid extends StatelessWidget {
  final _androidColor = Coolors.colorSet2[1];
  @override
  Widget build(BuildContext context) {
    return [
      Column(
        children: [
          VxAnimator<double>(
            builder: (context, animState, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VxContinuousRectangle(
                    height: 10.0,
                    width: 50.0,
                    backgroundColor: _androidColor,
                  ).rotate(animState.value * 10),
                  70.widthBox,
                  VxContinuousRectangle(
                    height: 10.0,
                    width: 50.0,
                    backgroundColor: _androidColor,
                  ).rotate(-animState.value * 10),
                ],
              );
            },
          ).doubleTween(4, 7.5).seconds(sec: 2).infinite.easeInOut.make(),
          VxCircle(
            radius: 200,
            backgroundColor: _androidColor,
            child: [
              VxCircle(
                backgroundColor: Colors.white,
                radius: 22.0,
              ).shadowXs,
              60.widthBox,
              VxCircle(
                backgroundColor: Colors.white,
                radius: 22.0,
              ).shadowXs,
            ]
                .hStack(
                    alignment: MainAxisAlignment.center,
                    crossAlignment: CrossAxisAlignment.start)
                .offset(offset: const Offset(0, 50.0)),
          ).clipHalf(),
          VxAnimator(
            builder: (context, animState, child) {
              return [
                Transform(
                  transform: Matrix4.rotationX(-animState.value),
                  child: VxCapsule(
                    backgroundColor: Coolors.colorSet2[1],
                    width: 60,
                    height: 210.0,
                  ).flipVertical().offset(offset: const Offset(0, 110)),
                ),
                10.widthBox,
                VxBox()
                    .square(200)
                    .withDecoration(BoxDecoration(
                        color: Coolors.colorSet2[1],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )))
                    .make()
                    .flipVertical()
                    .offset(offset: const Offset(0, 110)),
                10.widthBox,
                Transform(
                  transform: Matrix4.rotationX(animState.value),
                  child: VxCapsule(
                    backgroundColor: Coolors.colorSet2[1],
                    width: 60,
                    height: 210.0,
                  ).flipVertical().offset(offset: const Offset(0, 110)),
                ),
              ].hStack(crossAlignment: CrossAxisAlignment.center);
            },
          ).infinite.doubleTween(1, 0).linear.seconds(sec: 1).make(),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      [
        VxCapsule(
          backgroundColor: Coolors.colorSet2[1],
          width: 60,
          height: 200.0,
        ),
        35.widthBox,
        VxCapsule(
          backgroundColor: Coolors.colorSet2[1],
          width: 60,
          height: 200.0,
        )
      ].hStack(alignment: MainAxisAlignment.center).positioned(top: 270),
    ].zStack(alignment: Alignment.center);
  }
}
