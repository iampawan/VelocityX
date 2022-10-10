import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PlatformBar
    extends VxPlatform<AppBar, CupertinoNavigationBar, BottomAppBar, AppBar> {
  const PlatformBar({Key? key}) : super(key: key);

  @override
  AppBar createAndroidWidget(BuildContext context) {
    return AppBar(
      title: "Hello World".text.make(),
    );
  }

  @override
  CupertinoNavigationBar createIosWidget(BuildContext context) {
    return CupertinoNavigationBar(
      leading: "Hello World".text.make(),
    );
  }

  @override
  BottomAppBar createWebWidget(BuildContext context) {
    return BottomAppBar(
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Chat",
            icon: Icon(Icons.chat),
          ),
          BottomNavigationBarItem(
            label: "History",
            icon: Icon(Icons.history),
          )
        ],
      ),
    );
  }

  @override
  AppBar createDesktopWidget(BuildContext context) {
    return AppBar(
      title: "Hello World".text.make(),
    );
  }
}
