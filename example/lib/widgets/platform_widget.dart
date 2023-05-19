import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PlatformBar
    extends VxPlatform<AppBar, CupertinoNavigationBar, AppBar, AppBar> {
  const PlatformBar({super.key});

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
  AppBar createWebWidget(BuildContext context) {
    return AppBar(
      title: "Hello World from Web".text.make(),
    );
  }

  @override
  AppBar createDesktopWidget(BuildContext context) {
    return AppBar(
      title: "Hello World".text.make(),
    );
  }
}
