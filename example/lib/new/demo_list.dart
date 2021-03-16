import 'package:example/models/dummy.dart';
import 'package:example/widgets/vx_shapes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DemoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final VxPopupMenuController _controller = VxPopupMenuController();
    return Scaffold(
      backgroundColor: Vx.white,
      appBar: AppBar(
        title: "VxDemo".text.make(),
      ),
      body: VStack([
        ExpansionTile(
          title: "VxText With Box".text.make(),
          childrenPadding: Vx.m32,
          children: [
            "Vx Demo"
                .text
                .blue600
                .makeCentered()
                .box
                .p32
                .white
                // .shadow5xl
                .make()
                .innerShadow(),
          ],
        ),
        ExpansionTile(
          title: "Text+Box+Badge".text.make(),
          childrenPadding: Vx.m32,
          children: [
            "Hello"
                .text
                .make()
                .box
                .p8
                .rounded
                .lime200
                .alignCenter
                .withConstraints(
                    const BoxConstraints(maxWidth: 100, minWidth: 50))
                .make()
                .badge(
                    size: 20,
                    count: 200,
                    limit: false,
                    color: Colors.black,
                    type: VxBadgeType.round)
                .onInkTap(() {
              // Show Toast
              context.showToast(msg: "Hello Vx", position: VxToastPosition.top);
            }),
          ],
        ),
        ExpansionTile(
          title: "VxLayout".text.make(),
          childrenPadding: Vx.m32,
          children: [
            VxLayout(
              builder: (context, size, _) {
                return ElevatedButton(
                  onPressed: () {},
                  child: size.toString().text.make(),
                ).w(200).p16();
              },
            ),
          ],
        ),
        ExpansionTile(
          title: "VxStepper".text.make(),
          childrenPadding: Vx.m32,
          children: [
            VxStepper(onChange: (value) {
              print(value);
            }),
          ],
        ),
        ExpansionTile(
          title: "VxAnimator".text.make(),
          childrenPadding: Vx.m32,
          children: [
            VxAnimator<Color>(
              builder: (_, state, child) {
                return VxAnimatedBox()
                    .color(state.value)
                    .sizePCT(context: context, widthPCT: 50, heightPCT: 10)
                    .make();
              },
              child: "VelocityX".text.make(),
            ).colorTween(Vx.teal200, Vx.blue600).infinite.easeInOut.make(),
          ],
        ),
        ExpansionTile(
          title: "VxMarquee".text.make(),
          childrenPadding: Vx.m32,
          children: [
            "Breaking news from VelocityX - v1.0.0 Released"
                .marquee()
                .h10(context),
          ],
        ),
        ExpansionTile(
          title: "VxRating".text.make(),
          childrenPadding: Vx.m32,
          children: [
            VxRating(
              onRatingUpdate: (value) {},
              count: 5,
              selectionColor: Colors.teal,
              size: 30,
              stepInt: true,
            ),
          ],
        ),
        ExpansionTile(
          title: "VxTextField".text.make(),
          childrenPadding: Vx.m32,
          children: [
            const VxTextField(
              obscureText: true,
              borderType: VxTextFieldBorderType.roundLine,
              isPassword: true,
            ),
          ],
        ),
        ExpansionTile(
          title: "Mobile Or Web".text.make(),
          childrenPadding: Vx.m32,
          children: [
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
          ],
        ),
        ExpansionTile(
          title: "VxSwiper".text.make(),
          childrenPadding: Vx.m32,
          children: [
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
          ],
        ),
        ExpansionTile(
          title: "VxDevice".text.make(),
          childrenPadding: Vx.m32,
          children: [
            const VxDevice(mobile: Text("Hi Mobile"), web: Text("Hi Web")),
          ],
        ),
        ExpansionTile(
          title: "VxResponsive".text.make(),
          childrenPadding: Vx.m32,
          children: [
            const VxResponsive(
              xsmall: Text("Hi Extra Small"),
              small: Text("Hi Small"),
              medium: Text("Hi Medium"),
              large: Text("Hi Large"),
              xlarge: Text("Hi Extra Large"),
              fallback: Text("Hi Nothing Specified"),
            ),
          ],
        ),
        ExpansionTile(
          title: "VxCard".text.make(),
          childrenPadding: Vx.m32,
          children: [
            "Card Sample"
                .text
                .makeCentered()
                .card
                .make()
                .h10(context)
                .onMouseHover((event) {
              print(event.distance);
            }).onMouseEnter((event) {
              print(event.delta);
            }),
          ],
        ),
        ExpansionTile(
          title: "VxNeumorphic".text.make(),
          childrenPadding: Vx.m32,
          children: [
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
          ],
        ),
        ExpansionTile(
          title: "VxPopupMenu".text.make(),
          childrenPadding: Vx.m32,
          children: [
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
                            )
                                .box
                                .height(40)
                                .padding(Vx.mSymmetric(h: 20))
                                .make(),
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
          ],
        ),
        ExpansionTile(
          title: "VxShapes".text.make(),
          childrenPadding: Vx.m32,
          children: [
            VxShapes(),
          ],
        ),
        ExpansionTile(
          title: "VxDropDown".text.make(),
          childrenPadding: Vx.m32,
          children: [
            ["Item 1", "Item 2", "Item 3"]
                .textDropDown(
                  selectedValue: "Item 1",
                  onChanged: (value) {
                    Vx.log(value!);
                  },
                )
                .make(),
          ],
        ),
        ExpansionTile(
          title: "Circular Image".text.make(),
          childrenPadding: Vx.m32,
          children: [
            10.heightBox,
            "https://avatars0.githubusercontent.com/u/12619420?s=460&u=26db98cbde1dd34c7c67b85c240505a436b2c36d&v=4"
                .circularNetworkImage(),
          ],
        ),
        ExpansionTile(
          title: "VxDash".text.make(),
          childrenPadding: Vx.m32,
          children: [
            const VxDash(
              dashColor: Colors.red,
            ),
          ],
        ),
        ExpansionTile(
          title: "VxTimeAgo".text.make(),
          childrenPadding: Vx.m32,
          children: [
            DateTime.now().subtract(10.minutes).timeAgo().text.make(),
          ],
        ),
      ]).scrollVertical(),
    );
  }
}
