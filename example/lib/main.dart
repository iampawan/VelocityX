import 'package:example/widgets/platform_widget.dart';
import 'package:example/widgets/vx_shapes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'examples/animated_page_view.dart';
import 'examples/second_page.dart';
import 'models/dummy.dart';
import 'widgets/draw_android.dart';

void main() => runApp(
      MaterialApp(
        home: Material(child: Demo()),
        theme: ThemeData(
          primarySwatch: Colors.teal,
          brightness: Brightness.light,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final VxPopupMenuController _controller = VxPopupMenuController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Vx.inspect("message");
    return Scaffold(
      appBar: VxAppBar(
        searchBar: true,
        title: "Vx Demo".text.make(),
      ),
      body: VStack([
        PlatformBar(),
        "Vx Demo".text.white.makeCentered().circle(radius: 100).shadow4xl,
        10.heightBox,
        DrawAndroid(),
        10.heightBox,
        // TimelineExample(),
        // AnimatedBoxExample(),
        // VxAnimationExample(),
        // VxAnimator<double>(
        //   builder: (context, animState, child) {
        //     return VxBox()
        //         .rounded
        //         .alignCenter
        //         .pink400
        //         .square(animState.value)
        //         .makeCentered();
        //   },
        // ).easeInCubic.doubleTween(10.0, 200.0).seconds(sec: 10).infinite.make(),
        20.heightBox,
        "Hello"
            .text
            .make()
            .box
            .p8
            .rounded
            .red400
            .alignCenter
            .withConstraints(const BoxConstraints(maxWidth: 100, minWidth: 50))
            .make()
            .badge(
                size: 20,
                count: 200,
                limit: false,
                color: Colors.black,
                // optionalWidget: Icon(
                //   Icons.notification_important,
                //   size: 8.0,
                //   color: Colors.white,
                // ),
                type: VxBadgeType.round)
            .onInkTap(() {
          // Show Toast
          context.showToast(msg: "Hello Vx", position: VxToastPosition.top);
          // VxToast.showLoading(context, msg: "Loading");

          /// or
          // VxToast.show(context, msg: "Hello from vx", showTime: 10000);

          /// Or Show loading
          // final close = context.showLoading(
          //   msg: "Loading",
          // );
          // Future.delayed(2.seconds, close);
        }),
        10.heightBox,
        "Breaking news from VelocityX - v1.0.0 Released".marquee().h10(context),
        TapMeWidget(),
        10.heightBox,
        VxStepper(onChange: (value) {
          print(value);
        }),
        10.heightBox,
        VxRating(
          onRatingUpdate: (value) {},
          count: 5,
          selectionColor: Colors.teal,
          size: 30,
          stepInt: true,
        ),
        20.heightBox,
        const VxTextField(
          obscureText: true,
          borderType: VxTextFieldBorderType.roundLine,
          isPassword: true,
        ),
        20.heightBox,
        "${context.isMobile ? 'We are on mobile' : 'We are on Web'}"
            .selectableText
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
            .linearGradient([Vx.teal400, Vx.indigo400]).makeCentered(),
        20.heightBox,
        List.generate(
            50,
            (index) => "Item $index"
                .text
                .white
                .make()
                .box
                .rounded
                .alignCenter
                .color(Vx.randomOpaqueColor)
                .make()
                .p4()).swiper(
            height: context.isMobile ? 200 : 400,
            enlargeCenterPage: true,
            autoPlay: false,
            onPageChanged: (index) {
              print(index);
            },
            isFastScrollingEnabled: true,
            scrollDirection:
                context.isMobile ? Axis.horizontal : Axis.horizontal),
        20.heightBox,
        const VxDevice(mobile: Text("Hi Mobile"), web: Text("Hi Web")),
        const VxResponsive(
          xsmall: Text("Hi Extra Small"),
          small: Text("Hi Small"),
          medium: Text("Hi Medium"),
          large: Text("Hi Large"),
          xlarge: Text("Hi Extra Large"),
          fallback: Text("Hi Nothing Specified"),
        ),
        "Card Sample"
            .text
            .makeCentered()
            .card
            .color(Vx.indigo500)
            .make()
            .h10(context)
            .onMouseHover((event) {
          print(event.distance);
        }).onMouseEnter((event) {
          print(event.delta);
        }),
        20.heightBox,
        "100100.1546".numCurrency.text.make(),
        12341.42334.numCurrencyWithLocale(locale: "hi_IN").text.make(),
        10.heightBox,
        "https://avatars0.githubusercontent.com/u/12619420?s=460&u=26db98cbde1dd34c7c67b85c240505a436b2c36d&v=4"
            .circularNetworkImage(),
        10.heightBox,
        const VxDash(
          dashColor: Colors.red,
        ),
        10.heightBox,
        DateTime.now().subtract(10.minutes).timeAgo().text.make(),
        VxShapes(),
        20.heightBox,
        Container(
          child: const Icon(Icons.menu),
          padding: Vx.m20,
        ).popupMenu(
          () => ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: IntrinsicWidth(
              child: VStack(
                [
                  ItemModel(
                    "Chat",
                    Icons.chat_bubble,
                  ),
                  ItemModel(
                    "Add",
                    Icons.group_add,
                  )
                ]
                    .map(
                      (item) => GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          print(item.title);
                        },
                        child: HStack(
                          [
                            Icon(
                              item.icon,
                              size: 15,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: Text(
                                item.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              )
                                  .box
                                  .margin(Vx.mOnly(left: 10))
                                  .padding(Vx.mSymmetric(v: 10))
                                  .make(),
                            ),
                          ],
                        ).box.height(40).padding(Vx.mSymmetric(h: 20)).make(),
                      ),
                    )
                    .toList(),
                crossAlignment: CrossAxisAlignment.stretch,
              ),
            )
                .box
                .color(
                  const Color(0xFF4C4C4C),
                )
                .make(),
          ),
          clickType: VxClickType.singleClick,
          verticalMargin: -10,
          controller: _controller,
        ),
        20.heightBox,
        AnimatedPageView(),
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
                Vx.log(value!);
              },
            )
            .make(),
      ]).p16().scrollVertical(),
    );
  }
}

class TapMeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return [
      "Tap me"
          .text
          .maxLines(4)
          .semiBold
          .ellipsis
          .blue500
          .minFontSize(20)
          .make(),
      "assets/vxbox.png".circularAssetImage(radius: 50)
    ].row().onInkTap(() {
      context.navigator!.push(const SecondPage("assets/vxbox.png")
          .vxPreviewRoute(parentContext: context));
    });
  }
}
