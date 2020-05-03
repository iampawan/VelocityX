import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(MaterialApp(
      home: Demo(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
    ));

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Vx.inspect("message");
    return Scaffold(
      appBar: VxAppBar(
        searchBar: true,
        title: "Vx Demo".text.make(),
      ),
      body: VStack([
        "Welcome to VelocityX".text.semiBold.blue500.xl4.make(),
        20.heightBox,
        "${context.isMobile ? 'We are on mobile' : 'We are on Web'}"
            .text
            .bold
            .white
            .size(context.isMobile ? 20 : 40)
            .center
            .make()
            .animatedBox
            .width(!context.isMobile
                ? context.screenWidth
                : context.percentWidth * 50)
            .height(context.percentHeight * 20)
            .rounded
            .p8
            .alignCenter
            .shadow2xl
            .linearGradient([Vx.teal400, Vx.indigo400])
            .makeCentered()
            ,
        20.heightBox,
        [
          "Item 1"
              .text
              .white
              .make()
              .shimmer()
              .box
              .rounded
              .alignCenter
              .black
              .make()
              .p4(),
          "Item 2".text.make().box.rounded.alignCenter.green500.make().p4(),
          "Item 3".text.make().box.rounded.alignCenter.blue500.make().p4(),
          "Item 4".text.make().box.rounded.alignCenter.red500.make().p4(),
          "Item 5".text.make().box.rounded.alignCenter.orange500.make().p4(),
          "Item 6".text.make().box.rounded.alignCenter.pink500.make().p4(),
        ].swiper(
            height: context.isMobile ? 200 : 400,
            enlargeCenterPage: true,
            scrollDirection:
                context.isMobile ? Axis.vertical : Axis.horizontal),
        20.heightBox,
        "Neumorphic"
            .text
            .bold
            .make()
            .box
            .alignCenter
            .width(200)
            .height(200)
            .roundedLg
            .neumorphic(color: Colors.white, curve: VxCurve.flat)
            .make(),
        20.widthBox,
        const VxDiscList(
          ["Disc Item 1", "Disc Item 2"],
          primary: false,
        ),
        const VxDecimalList(
          ["Decimal Item 1", "Decimal Item 2"],
          primary: false,
        ),
        ["Item 1", "Item 2", "Item 3"]
            .textDropDown(
              selectedValue: "Item 1",
              onChanged: (value) {
                Vx.log(value);
              },
            )
            .make(),
      ]).p16().scrollVertical(),
    );
  }
}
