import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Sample
///
/// class PlatformAppBar extends VxPlatform<AppBar, CupertinoNavigationBar, AppBar, AppBar> {
///   final Widget title;
///   final Widget leading;
///   PlatformAppBar({
///     this.leading,
///     this.title,
///   });
///
///   @override
///   CupertinoNavigationBar createIosWidget(BuildContext context) =>
///        CupertinoNavigationBar(
///         leading: leading,
///         middle: title,
///       );
///
///   @override
///   AppBar createAndroidWidget(BuildContext context) =>  AppBar(
///         leading: leading,
///         title: title,
///       );
///   @override
///   AppBar createWebWidget(BuildContext context) =>  AppBar(
///         leading: leading,
///         title: title,
///       );
///   @override
///   AppBar createDesktopWidget(BuildContext context) =>  AppBar(
///         leading: leading,
///         title: title,
///       );
///}

///
abstract class VxPlatform<A extends Widget, I extends Widget, W extends Widget,
    D extends Widget> extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return createWebWidget(context);
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return createAndroidWidget(context);
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return createIosWidget(context);
    } else if (defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.windows) {
      return createDesktopWidget(context);
    }
    // platform not supported returns an empty widget
    return const Offstage();
  }

  A createAndroidWidget(BuildContext context);
  I createIosWidget(BuildContext context);
  W createWebWidget(BuildContext context);
  D createDesktopWidget(BuildContext context);
}
