import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'dummy.dart';

void main() => runApp(
      MaterialApp(
        home: Material(child: Demo()),
        theme:
            ThemeData(primarySwatch: Colors.teal, brightness: Brightness.light),
        debugShowCheckedModeBanner: false,
      ),
    );

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
        TimelineExample(),
        AnimatedBoxExample(),
        VxAnimationExample(),
        10.heightBox,
        "Hello"
            .text
            .make()
            .box
            .p8
            // .rounded
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
            .circlularNetworkImage(),
        10.heightBox,
        const VxDash(
          dashColor: Colors.red,
        ),
        10.heightBox,
        DateTime.now().subtract(10.minutes).timeAgo().text.make(),
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
                Vx.log(value);
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
      context.navigator.push(const _SecondPage("assets/vxbox.png")
          .vxPreviewRoute(parentContext: context));
    });
  }
}

class AnimatedBoxExample extends StatefulWidget {
  @override
  _AnimatedBoxExampleState createState() => _AnimatedBoxExampleState();
}

class _AnimatedBoxExampleState extends State<AnimatedBoxExample> {
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

class VxAnimationExample extends StatefulWidget {
  @override
  _VxAnimationExampleState createState() => _VxAnimationExampleState();
}

class _VxAnimationExampleState extends State<VxAnimationExample>
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
        .p16();
  }
}

class _SecondPage extends StatelessWidget {
  final String imageAssetName;

  const _SecondPage(this.imageAssetName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Material(
          child: InkWell(
            onTap: () => context.pop(),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                imageAssetName,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedPageView extends StatefulWidget {
  @override
  _AnimatedPageViewState createState() => _AnimatedPageViewState();
}

class _AnimatedPageViewState extends State<AnimatedPageView> {
  final List<double> _imgScaleMap = [0.8, 0.7, 1.0, 0.9, 1.2, 1.5];
  int _currentIndex = 0;

  List<String> parsePics() {
    return [
      "https://images.unsplash.com/photo-1523206489230-c012c64b2b48?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60",
      "https://images.unsplash.com/photo-1551721434-8b94ddff0e6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60",
      "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60",
      "https://images.unsplash.com/photo-1541560052-3744e48ab80b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60",
      "https://images.unsplash.com/photo-1559650656-5d1d361ad10e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60",
      "https://images.unsplash.com/photo-1512499617640-c74ae3a79d37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60",
    ];
  }

  double calculateImgScale(int index) {
    return _imgScaleMap[index];
  }

  @override
  Widget build(BuildContext context) {
    final List<String> pics = parsePics();
    if (pics.isEmpty) {
      return Container();
    }

    final Widget child = VxAnimatedHeightView<PageView>(
      pageViewChild: PageView.builder(
        itemCount: pics.length,
        controller: PageController(),
        itemBuilder: (context, index) {
          final String imgUrl = pics.elementAt(index);
          final double w = context.screenWidth;
          final double h = w * calculateImgScale(index);
          return GestureDetector(
            onTap: () {
              print("tap img index is $index");
            },
            child: Image.network(imgUrl ?? "",
                width: w,
                height: h,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter),
          );
        },
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      itemCount: pics.length,
      currentPageIndex: _currentIndex,
      computeAspectRadio: (index) {
        return calculateImgScale(index);
      },
      notifyScroll: (scrollNotification) {},
    );
    return child;
  }
}

class TimelineExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VxTimeline(
        animationDuration: 5.seconds,
        showTrailing: true,
        onItemTap: (value) {
          print(value.heading);
        },
        timelineList: List.generate(
          3,
          (index) => VxTimelineModel(
              id: index,
              heading: "Nov 01, 2020",
              description: "Hello Vx $index",
              actionUrl: ""),
        ).toList());
  }
}
