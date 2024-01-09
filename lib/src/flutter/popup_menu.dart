import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Provide click type either [longClick] or [singleClick]
enum VxClickType {
  longClick,
  singleClick,
}

typedef MenuBuilderCallback = Widget Function();

/// [VxPopupMenuController] gives you access to hide the menu or
/// toggle it using [showMenu], [hideMenu] & [toggleMenu].
class VxPopupMenuController extends ChangeNotifier {
  bool menuIsShowing = false;

  /// Method to show the [VxPopupMenu]
  void showMenu() {
    menuIsShowing = true;
    notifyListeners();
  }

  /// Method to hide the [VxPopupMenu]
  void hideMenu() {
    menuIsShowing = false;
    notifyListeners();
  }

  /// Method to toggle the [VxPopupMenu]
  void toggleMenu() {
    menuIsShowing = !menuIsShowing;
    notifyListeners();
  }
}

/// [VxPopupMenu] can help you in creating custom popup menus using overlay entry.
class VxPopupMenu extends StatefulWidget {
  const VxPopupMenu({
    required this.child,
    required this.menuBuilder,
    required this.clickType,
    super.key,
    this.controller,
    this.arrowColor = const Color(0xFF4C4C4C),
    this.showArrow = true,
    this.barrierColor = Colors.black12,
    this.arrowSize = 10.0,
    this.horizontalMargin = 10.0,
    this.verticalMargin = 10.0,
  });

  /// Child for the [VxPopupMenu] which can be clicked
  final Widget child;

  /// Specify the [clickType]. It can be [VxClickType.singleClick] or [VxClickType.longClick]
  final VxClickType clickType;

  /// Whether to show the arrow or not. Default is [true]
  final bool showArrow;

  /// Color of the arrow. Default is [Color(0xFF4C4C4C)]
  final Color arrowColor;

  /// Color of the barrier. Default is [Colors.black12]
  final Color barrierColor;

  /// Specify the [horizontalMargin]. Default is 10
  final double horizontalMargin;

  /// Specify the [verticalMargin]. Default is 10
  final double verticalMargin;

  /// Specify the [arrowSize]. Default is 10
  final double arrowSize;

  /// Specify the [controller] to control or hide/show the [VxPopupMenu]
  final VxPopupMenuController? controller;

  /// Compulsory to build a menu to show in the popup.
  final MenuBuilderCallback menuBuilder;
  @override
  VxPopupMenuState createState() => VxPopupMenuState();
}

class VxPopupMenuState extends State<VxPopupMenu> {
  RenderBox? _childBox;
  RenderBox? _parentBox;
  OverlayEntry? _overlayEntry;
  VxPopupMenuController? _controller;

  void _showMenu() {
    final Widget arrow = ClipPath(
      clipper: _ArrowClipper(),
      child: Container(
        width: widget.arrowSize,
        height: widget.arrowSize,
        color: widget.arrowColor,
      ),
    );

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          key: widget.key,
          children: <Widget>[
            GestureDetector(
              onTap: () => _hideMenu(),
              child: Container(
                color: widget.barrierColor,
              ),
            ),
            Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth:
                      _parentBox!.size.width - 2 * widget.horizontalMargin,
                  minWidth: 0,
                ),
                child: CustomMultiChildLayout(
                  delegate: _MenuLayoutDelegate(
                    anchorSize: _childBox!.size,
                    anchorOffset: _childBox!.localToGlobal(
                      Offset(-widget.horizontalMargin, 0),
                    ),
                    verticalMargin: widget.verticalMargin,
                  ),
                  children: <Widget>[
                    if (widget.showArrow)
                      LayoutId(
                        id: _MenuLayoutId.arrow,
                        child: arrow,
                      ),
                    if (widget.showArrow)
                      LayoutId(
                        id: _MenuLayoutId.downArrow,
                        child: Transform.rotate(
                          angle: math.pi,
                          child: arrow,
                        ),
                      ),
                    LayoutId(
                      id: _MenuLayoutId.content,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Material(
                            color: Colors.transparent,
                            child: widget.menuBuilder(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideMenu() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  void _updateView() {
    if (_controller!.menuIsShowing) {
      _showMenu();
    } else {
      _hideMenu();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller ??= VxPopupMenuController();
    _controller!.addListener(_updateView);
    WidgetsBinding.instance.addPostFrameCallback((call) {
      _childBox = context.findRenderObject() as RenderBox?;
      _parentBox = Overlay.of(context).context.findRenderObject() as RenderBox?;
    });
  }

  @override
  void dispose() {
    _hideMenu();
    _controller!.removeListener(_updateView);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (_) => _hideMenu(),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: widget.child,
        onTap: () {
          if (widget.clickType == VxClickType.singleClick) {
            if (!_controller!.menuIsShowing) {
              _showMenu();
              _controller!.menuIsShowing = true;
            } else {
              _hideMenu();
              _controller!.menuIsShowing = false;
            }
          }
        },
        onLongPress: () {
          if (widget.clickType == VxClickType.longClick) {
            if (!_controller!.menuIsShowing) {
              _showMenu();
              _controller!.menuIsShowing = true;
            } else {
              _hideMenu();
              _controller!.menuIsShowing = false;
            }
          }
        },
      ),
    );
  }
}

enum _MenuLayoutId {
  arrow,
  downArrow,
  content,
}

enum _MenuPosition {
  bottomLeft,
  bottomCenter,
  bottomRight,
  topLeft,
  topCenter,
  topRight,
}

class _MenuLayoutDelegate extends MultiChildLayoutDelegate {
  _MenuLayoutDelegate({
    this.anchorSize,
    this.anchorOffset,
    this.verticalMargin,
  });

  final Size? anchorSize;
  final Offset? anchorOffset;
  final double? verticalMargin;
  @override
  void performLayout(Size size) {
    Size contentSize = Size.zero;
    Size arrowSize = Size.zero;
    Offset contentOffset = const Offset(0, 0);
    Offset arrowOffset = const Offset(0, 0);

    final double anchorCenterX = anchorOffset!.dx + anchorSize!.width / 2;
    final double anchorTopY = anchorOffset!.dy;
    final double anchorBottomY = anchorTopY + anchorSize!.height;
    _MenuPosition menuPosition = _MenuPosition.bottomCenter;

    if (hasChild(_MenuLayoutId.content)) {
      contentSize = layoutChild(
        _MenuLayoutId.content,
        BoxConstraints.loose(size),
      );
    }
    if (hasChild(_MenuLayoutId.arrow)) {
      arrowSize = layoutChild(
        _MenuLayoutId.arrow,
        BoxConstraints.loose(size),
      );
    }
    if (hasChild(_MenuLayoutId.downArrow)) {
      layoutChild(
        _MenuLayoutId.downArrow,
        BoxConstraints.loose(size),
      );
    }

    bool isTop = false;
    if (anchorBottomY +
            verticalMargin! +
            arrowSize.height +
            contentSize.height >
        size.height) {
      isTop = true;
    }
    if (anchorCenterX - contentSize.width / 2 < 0) {
      menuPosition = isTop ? _MenuPosition.topLeft : _MenuPosition.bottomLeft;
    } else if (anchorCenterX + contentSize.width / 2 > size.width) {
      menuPosition = isTop ? _MenuPosition.topRight : _MenuPosition.bottomRight;
    } else {
      menuPosition =
          isTop ? _MenuPosition.topCenter : _MenuPosition.bottomCenter;
    }

    switch (menuPosition) {
      case _MenuPosition.bottomCenter:
        arrowOffset = Offset(
          anchorCenterX - arrowSize.width / 2,
          anchorBottomY + verticalMargin!,
        );
        contentOffset = Offset(
          anchorCenterX - contentSize.width / 2,
          anchorBottomY + verticalMargin! + arrowSize.height,
        );
        break;
      case _MenuPosition.bottomLeft:
        arrowOffset = Offset(anchorCenterX - arrowSize.width / 2,
            anchorBottomY + verticalMargin!);
        contentOffset = Offset(
          0,
          anchorBottomY + verticalMargin! + arrowSize.height,
        );
        break;
      case _MenuPosition.bottomRight:
        arrowOffset = Offset(anchorCenterX - arrowSize.width / 2,
            anchorBottomY + verticalMargin!);
        contentOffset = Offset(
          size.width - contentSize.width,
          anchorBottomY + verticalMargin! + arrowSize.height,
        );
        break;
      case _MenuPosition.topCenter:
        arrowOffset = Offset(
          anchorCenterX - arrowSize.width / 2,
          anchorTopY - verticalMargin! - arrowSize.height,
        );
        contentOffset = Offset(
          anchorCenterX - contentSize.width / 2,
          anchorTopY - verticalMargin! - arrowSize.height - contentSize.height,
        );
        break;
      case _MenuPosition.topLeft:
        arrowOffset = Offset(
          anchorCenterX - arrowSize.width / 2,
          anchorTopY - verticalMargin! - arrowSize.height,
        );
        contentOffset = Offset(
          0,
          anchorTopY - verticalMargin! - arrowSize.height - contentSize.height,
        );
        break;
      case _MenuPosition.topRight:
        arrowOffset = Offset(
          anchorCenterX - arrowSize.width / 2,
          anchorTopY - verticalMargin! - arrowSize.height,
        );
        contentOffset = Offset(
          size.width - contentSize.width,
          anchorTopY - verticalMargin! - arrowSize.height - contentSize.height,
        );
        break;
    }
    if (hasChild(_MenuLayoutId.content)) {
      positionChild(_MenuLayoutId.content, contentOffset);
    }
    bool isBottom = false;
    if (_MenuPosition.values.indexOf(menuPosition) < 3) {
      // bottom
      isBottom = true;
    }
    if (hasChild(_MenuLayoutId.arrow)) {
      positionChild(
        _MenuLayoutId.arrow,
        isBottom
            ? Offset(arrowOffset.dx, arrowOffset.dy + 0.1)
            : const Offset(-100, 0),
      );
    }
    if (hasChild(_MenuLayoutId.downArrow)) {
      positionChild(
        _MenuLayoutId.downArrow,
        !isBottom
            ? Offset(arrowOffset.dx, arrowOffset.dy - 0.1)
            : const Offset(-100, 0),
      );
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}

class _ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
