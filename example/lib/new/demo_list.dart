import 'package:example/models/dummy.dart';
import 'package:example/widgets/vx_shapes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DemoList extends StatelessWidget {
  final String? x = null;
  final List<String> list = [
    'Dart',
    'Flutter',
    'iOS',
    'Kotlin',
    'Android',
    'Java',
    'Swift',
    'SQL',
    'NodeJS',
    'Python',
    'JS'
  ];

  final List<String> imagePath = [
    'https://images.unsplash.com/photo-1601933470096-0e34634ffcde?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1593642532009-6ba71e22f468?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1520333789090-1afc82db536a?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxNnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1618572195571-1fdd75cd7add?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  ];

  @override
  Widget build(BuildContext context) {
    final y = guard(() => x, "Guard - No value found");
    print(y);
    final VxPopupMenuController _controller = VxPopupMenuController();
    return Scaffold(
      backgroundColor: Vx.white,
      appBar: AppBar(
        title: "VxDemo".text.make(),
      ),
      body: VStack([
        ExpansionTile(
          title: "VxNav 2.0".text.make(),
          childrenPadding: Vx.m32,
          children: [
            TextButton(
                onPressed: () {
                  context.vxNav.push(Uri(
                    path: '/nav/path123',
                    queryParameters: {
                      'query': 'xyz',
                      'qlist': ['List', 'of', 'values']
                    },
                  ));
                },
                child: "Test Nav4".text.make()),
            TextButton(
              onPressed: () {
                VxNavigator.of(context).push(Uri(path: "/nav1"));
              },
              child: "Push Page".text.make(),
            ),
            TextButton(
              onPressed: () {
                VxNavigator.of(context).replace(Uri(path: "/nav1"));
              },
              child: "Replace Page".text.make(),
            ),
            TextButton(
              onPressed: () {
                VxNavigator.of(context).pushAll([
                  Uri(path: "/nav1"),
                  Uri(path: "/nav2"),
                  Uri(path: "/nav3")
                ]);
              },
              child: "Push All".text.make(),
            ),
            TextButton(
              onPressed: () {
                VxNavigator.of(context).clearAndPushAll([
                  Uri(path: "/nav1"),
                  Uri(path: "/nav2"),
                  Uri(path: "/nav3")
                ]);
              },
              child: "Clear & Push All".text.make(),
            ),
            TextButton(
              onPressed: () async {
                final path = await VxNavigator.of(context)
                    .waitAndPush(Uri(path: "/nav1"));

                print("Returned $path");
              },
              child: "Wait & Push".text.make(),
            ),
          ],
        ),
        ExpansionTile(
          title: "VxText With Box".text.make(),
          childrenPadding: Vx.m32,
          children: [
            "Vx Demo"
                .text
                .white
                .makeCentered()
                .box
                .p32
                .red700
                .rounded
                .outerShadow2Xl
                .make()
                .onTap(() {
              VxNavigator.of(context).push(Uri(path: "/demo"));
            }),
          ],
        ),
        ExpansionTile(
          title: "Text+Box+Badge".text.make(),
          childrenPadding: Vx.m32,
          children: [
            "Hello"
                .text
                .yellow500
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
              context.showToast(
                  msg: "Hello Vx",
                  position: VxToastPosition.top,
                  showTime: 3000);
            }),
          ],
        ),
        ExpansionTile(
          title: "VxPinView".text.make(),
          childrenPadding: Vx.m32,
          children: [
            const VxPinView(
              type: VxPinBorderType.underline,
            ),
            20.heightBox,
            const VxPinView(
              type: VxPinBorderType.underline,
              count: 8,
              size: 30,
            ),
            20.heightBox,
            VxPinView(
              type: VxPinBorderType.round,
              keyboardType: TextInputType.number,
              obscureText: false,
              onChanged: (value) {
                print('Test value=$value');
              },
            ),
            20.heightBox,
            const VxPinView(
              type: VxPinBorderType.round,
              obscureText: false,
              color: Colors.red,
              contentColor: Colors.blue,
            ),
            20.heightBox,
            const VxPinView(
              type: VxPinBorderType.round,
              obscureText: false,
              color: Colors.green,
              contentColor: Colors.white,
              fill: true,
            ),
          ],
        ),
        ExpansionTile(
            title: "VxDialog".text.make(),
            childrenPadding: Vx.m32,
            children: [
              ElevatedButton(
                onPressed: () {
                  VxDialog.showAlert(
                    context,
                    content: 'Welcome to VxDialog',
                    title: 'Hello Alert',
                    showClose: true,
                    onPressed: () {
                      VxToast.show(context, msg: 'Alert toast');
                    },
                  );
                },
                child: "Alert with Title & X button".text.make(),
              ),
              ElevatedButton(
                onPressed: () {
                  VxDialog.showConfirmation(
                    context,
                    content: 'This might erase everything.',
                    title: 'Are you sure?',
                    onCancelPress: () {
                      VxToast.show(context, msg: 'Cancelled');
                    },
                    onConfirmPress: () {
                      VxToast.show(context, msg: 'Confirmed');
                    },
                  );
                },
                child: "Confirmation Dialog".text.make(),
              ),
              ElevatedButton(
                onPressed: () {
                  VxDialog.showTicker(
                    context,
                    content:
                        'Action will be enabled after a particular given time',
                    title: 'Ticker Dialog',
                    secondsToAction: 5,
                    barrierDismissible: false,
                    onConfirmPress: () {
                      VxToast.show(context, msg: 'Confirmed');
                    },
                  );
                },
                child: "Ticker Dialog".text.make(),
              ),
              ElevatedButton(
                onPressed: () {
                  VxDialog.showConfirmation(
                    context,
                    content: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          const Text('Name'),
                          const TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter name',
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: false,
                                onChanged: (value) {},
                              ),
                              const Expanded(child: Text('I agree')),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Radio(
                                value: true,
                                groupValue: '1',
                                onChanged: (value) {},
                              ),
                              const Expanded(child: Text('Got it')),
                            ],
                          ),
                          Container(
                            height: 50,
                            color: Colors.blue,
                          ),
                          Container(
                            height: 100,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    title: 'Custom Content Dialog',
                    showClose: true,
                    cancel: 'Cancel',
                    confirm: 'Confirm',
                    cancelBgColor: Colors.red,
                    cancelTextColor: Colors.white,
                    confirmBgColor: Colors.blue,
                    confirmTextColor: Colors.red,
                    onCancelPress: () {
                      VxToast.show(context, msg: 'Cancelled');
                    },
                    onConfirmPress: () {
                      VxToast.show(context, msg: 'Confirmed');
                    },
                  );
                },
                child: "Custom Content Dialog".text.make(),
              ),
              ElevatedButton(
                onPressed: () {
                  VxDialog.showCustom(
                    context,
                    barrierDismissible: false,
                    child: Material(
                      child: Container(
                        width: context.screenWidth * 0.5,
                        color: Vx.gray200,
                        child: IntrinsicHeight(
                          child: Column(children: [
                            Image.asset('assets/vxbox.png'),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 60,
                                alignment: Alignment.center,
                                child: const Text('Cancel'),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  );
                },
                child: "Custom Dialog".text.make(),
              ),
            ]),
        ExpansionTile(
          title: "VxBottomSheet".text.make(),
          childrenPadding: Vx.m32,
          children: [
            ElevatedButton(
              onPressed: () {
                VxBottomSheet.bottomSheetOptions(
                  context,
                  option: list,
                  defaultData: 'Flutter',
                  backgroundColor: Colors.white,
                  roundedFromTop: true,
                  enableDrag: false,
                  isSafeAreaFromBottom: true,
                  onSelect: (index, value) {
                    VxToast.show(context, msg: 'index=$index value=$value');
                  },
                ).then((data) {
                  print('Test data=$data');
                });
              },
              child: "Menu Options View".text.make(),
            ),
            ElevatedButton(
              onPressed: () {
                VxBottomSheet.bottomSheetView(context,
                    roundedFromTop: true,
                    isDismissible: false,
                    backgroundColor: Colors.white,
                    isSafeAreaFromBottom: true,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              const SizedBox(width: 40),
                              const Expanded(
                                child: Text('Sheet View',
                                    textAlign: TextAlign.center),
                              ),
                              IconButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'hello'),
                                icon: const Icon(Icons.clear, size: 24),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                const ListTile(
                                    leading: Icon(Icons.add),
                                    title: Text('Add')),
                                const ListTile(
                                    leading: Icon(Icons.email),
                                    title: Text('Email')),
                                const ListTile(
                                    leading: Icon(Icons.phone),
                                    title: Text('Phone')),
                                const ListTile(
                                    leading: Icon(Icons.cloud_upload),
                                    title: Text('Upload')),
                                const TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Enter something'))
                                    .p16(),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                    child: const Text("Close"),
                                    onPressed: () =>
                                        Navigator.pop(context, 'sure'))
                              ],
                            ),
                          ),
                        ),
                      ],
                    )).then((data) {
                  print('Test data=$data');
                });
              },
              child: "Bottom Sheet View".text.make(),
            ),
          ],
        ),
        ExpansionTile(
          title: "VxPreview".text.make(),
          childrenPadding: Vx.m32,
          children: List.generate(imagePath.length, (index) {
            return GestureDetector(
              onTap: () {
                VxPreview.show(
                  context,
                  itemCount: imagePath.length,
                  defaultIndex: index,
                  itemBuilder: (int temp) => GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.network(imagePath[temp]),
                  ),
                );
              },
              child: Image.network(imagePath[index]),
            );
          }).map((e) => e).toList(),
        ),
        ExpansionTile(
          title: "VxDrawer".text.make(),
          childrenPadding: Vx.m32,
          children: [
            ElevatedButton(
                onPressed: () {
                  VxDrawer.showTopNotification(
                    context,
                    child: "Hi VelocityX"
                        .text
                        .semiBold
                        .xl
                        .makeCentered()
                        .p16()
                        .box
                        .alignCenter
                        .height(150)
                        .green400
                        .make(),
                  );
                },
                child: "Show Top Drawer".text.make()),
            ElevatedButton(
                onPressed: () {
                  VxDrawer.showBottomNotification(
                    context,
                    child: "Hi VelocityX"
                        .text
                        .semiBold
                        .xl
                        .makeCentered()
                        .p16()
                        .box
                        .alignCenter
                        .height(150)
                        .red400
                        .make(),
                  );
                },
                child: "Show Bottom Drawer".text.make()),
            ElevatedButton(
                onPressed: () {
                  VxDrawer.show(
                    context,
                    type: VxDrawerType.left,
                    child: const MyDrawer(),
                  );
                },
                child: "Show Left Drawer".text.make()),
            ElevatedButton(
                onPressed: () {
                  VxDrawer.show(
                    context,
                    type: VxDrawerType.right,
                    child: const MyDrawer(),
                  );
                },
                child: "Show Right Drawer".text.make())
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
            VxTextField(
              obscureText: true,
              borderType: VxTextFieldBorderType.roundLine,
              isPassword: true,
              onChanged: (s) {
                print(s);
              },
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

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: Vx.m0,
        children: [
          UserAccountsDrawerHeader(
            accountName: "Pawan".text.make(),
            accountEmail: "mtechviral@gmail.com".text.make(),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: "Home".text.make(),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: "Account".text.make(),
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: "Email".text.make(),
          )
        ],
      ),
    );
  }
}
