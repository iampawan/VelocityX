import 'dart:async';

import 'package:flutter/material.dart';

enum VxDrawerType {
  left,
  right,
  top,
  bottom,
}

mixin VxDrawer {
  static VoidCallback showTopNotification(
    BuildContext context, {
    required Widget child,
    bool showMask = false,
    bool autoHide = true,
  }) {
    return _showBaseDrawer(
      context,
      child: child,
      type: VxDrawerType.top,
      showMask: showMask,
      autoHide: autoHide,
    );
  }

  static VoidCallback showBottomNotification(
    BuildContext context, {
    required Widget child,
    bool showMask = false,
    bool autoHide = true,
  }) {
    return _showBaseDrawer(
      context,
      child: child,
      type: VxDrawerType.bottom,
      showMask: showMask,
      autoHide: autoHide,
    );
  }

  static VoidCallback show(
    BuildContext context, {
    required Widget child,
    VxDrawerType type = VxDrawerType.left,
    bool showMask = true,
    bool autoHide = false,
  }) {
    return _showBaseDrawer(
      context,
      child: child,
      type: type,
      showMask: showMask,
      autoHide: autoHide,
    );
  }

  static VoidCallback _showBaseDrawer(
    BuildContext context, {
    Widget? child,
    VxDrawerType type = VxDrawerType.left,
    bool showMask = false,
    bool autoHide = true,
  }) {
    final OverlayState overlayState = Overlay.of(context);

    final GlobalKey<_VxDrawerState> key = GlobalKey();

    VoidCallback? hide;

    OverlayEntry? overlayEntry = OverlayEntry(
      builder: (BuildContext context) => _VxDrawer(
        key: key,
        type: type,
        maskTap: hide,
        showMask: showMask,
        child: child,
      ),
    );
    overlayState.insert(overlayEntry);

    final ModalRoute? route = ModalRoute.of(context);
    Future<bool> backClose() {
      hide!();
      return Future.value(false);
    }

    // TODO(iampawan): Not sure how to change it to use `PopEntry`
    route?.addScopedWillPopCallback(backClose);

    hide = () async {
      // TODO(iampawan): Not sure how to change it to use `PopEntry`
      route?.removeScopedWillPopCallback(backClose);
      await key.currentState?.reverseAnimation();
      overlayEntry?.remove();
      overlayEntry = null;
    };

    if (autoHide) {
      Future.delayed(
        const Duration(milliseconds: 2000),
        hide,
      );
    }

    return hide;
  }
}

class _VxDrawer extends StatefulWidget {
  final VxDrawerType? type;
  final Widget? child;
  final Function? maskTap;
  final bool? showMask;

  const _VxDrawer({
    super.key,
    this.type,
    this.child,
    this.maskTap,
    this.showMask,
  });

  @override
  _VxDrawerState createState() => _VxDrawerState();
}

class _VxDrawerState extends State<_VxDrawer> with TickerProviderStateMixin {
  int duration = 300;
  GlobalKey boxKey = GlobalKey();
  AnimationController? controller;

  Animation<double>? offsetAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );

    offsetAnimation = Tween<double>(begin: 2000, end: 0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Curves.ease,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback(getBoxHeight);
  }

  void getBoxHeight(Duration time) {
    initAnimation();
  }

  // Reverse Animation
  Future<void> reverseAnimation() async {
    await controller?.reverse();
  }

  // Initialization
  void initAnimation() {
    final double? size =
        widget.type == VxDrawerType.top || widget.type == VxDrawerType.bottom
            ? boxKey.currentContext?.size?.height
            : boxKey.currentContext?.size?.width;

    double begin;
    // switch case
    switch (widget.type!) {
      case VxDrawerType.top:
      case VxDrawerType.left:
        begin = -size!;
        break;
      case VxDrawerType.right:
      case VxDrawerType.bottom:
        begin = size!;
        break;
    }

    offsetAnimation = Tween<double>(begin: begin, end: 0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Curves.ease,
      ),
    );
    // Forward animation
    controller?.forward();
  }

  @override
  Widget build(BuildContext context) {
    Offset offset;
    double? top = 0.0;
    double? right = 0.0;
    double? bottom = 0.0;
    double? left = 0.0;

    // 判断方向
    switch (widget.type!) {
      case VxDrawerType.top:
        bottom = null;
        break;
      case VxDrawerType.right:
        left = null;
        break;
      case VxDrawerType.bottom:
        top = null;
        break;
      case VxDrawerType.left:
        right = null;
        break;
    }
    return AnimatedBuilder(
        animation: controller!,
        builder: (BuildContext context, Widget? child) {
          // 方向
          if (widget.type == VxDrawerType.top ||
              widget.type == VxDrawerType.bottom) {
            offset = Offset(
              0,
              offsetAnimation!.value,
            );
          } else {
            offset = Offset(
              offsetAnimation!.value,
              0,
            );
          }

          final List<Widget> children = [];

          if (widget.showMask!) {
            children.add(Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              left: 0,
              child: GestureDetector(
                onTap: maskTap,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black45,
                  ),
                ),
              ),
            ));
          }

          children.add(
            Positioned(
              top: top,
              right: right,
              bottom: bottom,
              left: left,
              child: Transform.translate(
                offset: offset,
                child: DecoratedBox(
                  key: boxKey,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Material(
                    child: widget.child,
                  ),
                ),
              ),
            ),
          );

          return Stack(children: children);
        });
  }

  void maskTap() {
    if (widget.maskTap != null) {
      widget.maskTap!();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
