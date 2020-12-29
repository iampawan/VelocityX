import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Sample
///
/// class PlatformAppBar extends VxPlatform<AppBar, CupertinoNavigationBar, AppBar> {
///   final Widget title;
///   final Widget leading;
///   PlatformAppBar({
///     this.leading,
///     this.title,
///   });
///
///   @override
///   CupertinoNavigationBar createIosWidget(BuildContext context) =>
///       new CupertinoNavigationBar(
///         leading: leading,
///         middle: title,
///       );
///
///   @override
///   AppBar createAndroidWidget(BuildContext context) => new AppBar(
///         leading: leading,
///         title: title,
///       );
///   @override
///   AppBar createWebWidget(BuildContext context) => new AppBar(
///         leading: leading,
///         title: title,
///       );
///}

///
abstract class VxPlatform<A extends Widget, I extends Widget, W extends Widget>
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return createWebWidget(context);
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return createAndroidWidget(context);
    } else if (Platform.isIOS) {
      return createIosWidget(context);
    }
    // platform not supported returns an empty widget
    return const Offstage();
  }

  A createAndroidWidget(BuildContext context);
  I createIosWidget(BuildContext context);
  W createWebWidget(BuildContext context);
}
