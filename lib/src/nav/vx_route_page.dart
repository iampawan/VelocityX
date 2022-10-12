import 'package:flutter/material.dart';

Map<String?, int> _navigatorManagerPageMap = {};
ValueKey _createPageKey(String? name) {
  name = name ?? "";
  if (_navigatorManagerPageMap[name] != null) {
    _navigatorManagerPageMap[name] = _navigatorManagerPageMap[name]! + 1;
    name = name + '-${_navigatorManagerPageMap[name]}';
  } else {
    _navigatorManagerPageMap[name] = 0;
    name = name + '-${_navigatorManagerPageMap[name]}';
  }
  return ValueKey(name);
}

class VxRoutePage extends Page {
  final String? pageName;
  final Widget? child;
  final bool maintainState;
  final bool fullscreenDialog;
  final bool isTransparent;
  final Widget Function(Animation<double> animation, Widget child)? transition;
  VxRoutePage({
    this.pageName,
    this.child,
    this.maintainState = true,
    this.fullscreenDialog = false,
    this.transition,
    this.isTransparent = false,
  }) : super(key: _createPageKey(pageName));

  @override
  Route createRoute(BuildContext context) {
    if (transition != null) {
      return PageRouteBuilder(
        opaque: !isTransparent,
        settings: this,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        pageBuilder: (context, animation, secondaryAnimation) => child!,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return transition!(animation, child);
        },
      );
    } else {
      return PageRouteBuilder(
        opaque: !isTransparent,
        settings: this,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        pageBuilder: (context, animation, secondaryAnimation) => child!,
      );
    }
  }
}
