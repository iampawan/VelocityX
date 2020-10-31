import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'dummy.dart';

void main() => runApp(MaterialApp(
      home: Demo(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
    ));

class Demo extends StatelessWidget {
  final VxPopupMenuController _controller = VxPopupMenuController();
  @override
  Widget build(BuildContext context) {
    Vx.inspect("message");
    return Scaffold(
      appBar: VxAppBar(
        searchBar: true,
        title: "Vx Demo".text.make(),
      ),
      body: VStack([
        AnimationExample(),
        AnimationExample2(),
        10.heightBox,
        "Hello"
            .selectableText
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
                count: 1,
                limit: true,
                color: Colors.black,
                type: VxBadgeType.round),
        10.heightBox,
        "Breaking news from VelocityX".marquee().h10(context),
        "Tap me"
            .text
            .maxLines(4)
            .semiBold
            .ellipsis
            .blue500
            .minFontSize(20)
            .make()
            .click(() {
          // Show Toast
          // context.showToast(msg: "Hello Vx", position: VxToastPosition.top);

          context.navigator
              .push(AnimationExample2().vxRoute(parentContext: context));

          /// or
          // VxToast.show(context, msg: "Hello from vx");

          /// Show loading
          // final close = context.showLoading(msg: "Loading");
          // Future.delayed(2.seconds, close);
        }).make(),
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
            .linearGradient([Vx.teal400, Vx.indigo400]).makeCentered(),
        20.heightBox,
        [
          "Item 1".text.white.make().box.rounded.alignCenter.black.make().p4(),
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
            .h10(context),
        20.heightBox,
        "100100.1546".numCurrency.text.make(),
        12341.42334.numCurrencyWithLocale(locale: "hi_IN").text.make(),
        10.heightBox,
        "https://avatars0.githubusercontent.com/u/12619420?s=460&u=26db98cbde1dd34c7c67b85c240505a436b2c36d&v=4"
            .circlularNetworkImage(),
        10.heightBox,
        const VxDash(
          dashColor: Colors.red,
        ),
        10.heightBox,
        DateTime.now().timeAgo().text.make(),
        10.heightBox,
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

class AnimationExample extends StatefulWidget {
  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  double _width, _height, _radius;
  Color _color;

  @override
  void initState() {
    super.initState();

    Timer.periodic(5.seconds, (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();

    // Generate a random width and height.
    _width = random.nextInt(300).toDouble();
    _height = random.nextInt(300).toDouble();

    // Generate a random color.
    _color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );

    // Generate a random border radius.
    _radius = random.nextInt(100).toDouble();
    return VxAnimatedBox()
        .seconds(sec: 5)
        .fastOutSlowIn
        .width(_width + 50)
        .height(_height)
        .color(_color)
        .withRounded(value: _radius)
        .p16
        .alignCenter
        .make()
        .py16();
  }
}

class AnimationExample2 extends StatefulWidget {
  @override
  _AnimationExample2State createState() => _AnimationExample2State();
}

class _AnimationExample2State extends State<AnimationExample2>
    with SingleTickerProviderStateMixin {
  num anim = 1.0;

  @override
  void initState() {
    super.initState();

    withRepeatAnimation(
      vsync: this,
      tween: Tween(begin: 0.2, end: 2.0),
      duration: 5.seconds,
      isRepeatReversed: true,
      callBack: (value, percent) {
        anim = value;
        setState(() {});
        // print(anim);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return "Animated Text"
        .text
        .semiBold
        .center
        .makeCentered()
        .scale(scaleValue: anim)
        .p16()
        .card
        .make();
  }
}
