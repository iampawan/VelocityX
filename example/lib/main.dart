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
      //   child: VelocityListDisc(
      //     ["Pawan", "Kumar", "is", "a", "Pro"],
      //     fontSize: 24,
      //     color: VelocityX.redColor500,
      //   ),
      // );
      child: VelocityDevice(
          mobile: "Mobile".text.white.xl4.semiBold.center.makeCentered().box.roundedLg.green500.shadow2xl.make().whHalf(context).centered(),
          web: "Web".text.white.xl4.bold.center.makeCentered().box.roundedLg.red500.shadow2xl.make().whHalf(context).centered()),
    );

    // return Material(
    //     child: Center(
    //   child: Container(
    //     height: 100,
    //     width: 100,
    //     decoration: BoxDecoration(
    //         color: Colors.purple.shade500,
    //         borderRadius: BorderRadius.circular(15),
    //         boxShadow: [
    //           BoxShadow(
    //             blurRadius: 3.0,
    //             color: Colors.black.withOpacity(0.5),
    //           )
    //         ]),
    //     child: Center(
    //       child: Text(
    //         "Hi",
    //         textScaleFactor: 3,
    //         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    //       ),
    //     ),
    //   ),
    // ));
  }
}
