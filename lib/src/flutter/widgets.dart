/*
 * Copyright (c) 2020 Pawan Kumar. All rights reserved.
 *
 *  * Licensed under the Apache License, Version 2.0 (the "License");
 *  * you may not use this file except in compliance with the License.
 *  * You may obtain a copy of the License at
 *  * http://www.apache.org/licenses/LICENSE-2.0
 *  * Unless required by applicable law or agreed to in writing, software
 *  * distributed under the License is distributed on an "AS IS" BASIS,
 *  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  * See the License for the specific language governing permissions and
 *  * limitations under the License.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../velocity_x.dart';

extension WidgetsExtension on Widget {
  ///Tooltip as accessibility
  Widget tooltip(String message,
          {Key key,
          Decoration decoration,
          double height,
          bool preferBelow,
          EdgeInsetsGeometry padding,
          TextStyle textStyle,
          Duration waitDuration,
          EdgeInsetsGeometry margin}) =>
      Tooltip(
        key: key,
        message: message,
        decoration: decoration,
        height: height,
        padding: padding,
        preferBelow: preferBelow,
        textStyle: textStyle,
        waitDuration: waitDuration,
        margin: margin,
        child: this,
      );

  ///Hides a widget
  Widget hide({Key key, bool isVisible = false, bool maintainSize = false}) =>
      Visibility(
        key: key,
        child: this,
        visible: isVisible,
        maintainSize: maintainSize,
        maintainAnimation: maintainSize,
        maintainState: maintainSize,
      );

  ///Hides a widget
  Widget popupMenu(
    MenuBuilderCallback menuBuilder, {
    Key key,
    VxPopupMenuController controller,
    Color arrowColor = const Color(0xFF4C4C4C),
    double arrowSize = 10.0,
    Color barrierColor = Colors.black12,
    double horizontalMargin = 10.0,
    double verticalMargin = 10.0,
    bool showArrow = true,
    VxClickType clickType = VxClickType.singleClick,
  }) =>
      VxPopupMenu(
        key: key,
        child: this,
        clickType: clickType,
        controller: controller,
        arrowColor: arrowColor,
        arrowSize: arrowSize,
        barrierColor: barrierColor,
        horizontalMargin: horizontalMargin,
        showArrow: showArrow,
        verticalMargin: verticalMargin,
        menuBuilder: menuBuilder,
      );

  /// Widget to show exception
  Widget errorWidget(Object ex) => ErrorWidget(ex);

  /// Extension for [Expanded]
  Expanded expand({Key key, int flex = 1}) {
    return Expanded(
      key: key,
      flex: flex,
      child: this,
    );
  }

  /// Extension for Stack [Positioned]
  Widget positioned(
      {double top,
      double bottom,
      double left,
      double right,
      double height,
      double width,
      bool isFilled = false}) {
    return isFilled
        ? Positioned.fill(
            key: key,
            top: top,
            bottom: bottom,
            left: left,
            right: right,
            child: this,
          )
        : Positioned(
            key: key,
            top: top,
            bottom: bottom,
            left: left,
            right: right,
            height: height,
            width: width,
            child: this,
          );
  }

  /// Extension for coloring a widget with [DecoratedBox]
  DecoratedBox backgroundColor(Color color) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
      ),
      child: this,
    );
  }

  /// Extension for giving a stroke with [DecoratedBox]
  DecoratedBox stroke(double width, Color color, {bool isCircle = false}) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: color, width: width),
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: this,
    );
  }

  /// Extension for aspectRatio with [AspectRatio]
  AspectRatio aspectRatio(double aspectRatio) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: this,
    );
  }

  /// Extension for adding a corner radius a widget with [ClipRRect]
  ClipRRect cornerRadius(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: this,
    );
  }

  /// Extension for creating a half shape using [VxHalfClipper]
  ClipPath clipHalf({Clip clipBehavior = Clip.antiAlias}) {
    return ClipPath(
      key: key,
      clipBehavior: clipBehavior,
      clipper: VxHalfClipper(),
      child: this,
    );
  }

  /// Extension for keepAlive
  Widget keepAlive() {
    return _KeepAliveWidget(this);
  }

  /// Extension for SliverToBox
  SliverToBoxAdapter sliverBoxAdapter() {
    return SliverToBoxAdapter(
      child: this,
    );
  }

  ///Maybe often use this when you want to make your own AppBar or NavigationBar with your custom UI
  ///
  /// tip:the size of ios navigation bar is Size.fromHeight(44.0) [kMinInteractiveDimensionCupertino],
  /// material style appBar is Size.fromHeight(56.0)   [kToolbarHeight],
  ///
  /// example:
  ///  appBar: Center(
  ///   child: Text("hello"),
  /// ).preferredSize(Size.fromHeight(44.0)),
  PreferredSize preferredSize(Size size) {
    return PreferredSize(child: this, preferredSize: size);
  }

  /// Extension method for [Material] Widget
  Widget material(
          {Key key,
          MaterialType type = MaterialType.canvas,
          Duration animationDuration = kThemeAnimationDuration,
          bool borderOnForeground = true,
          BorderRadiusGeometry borderRadius,
          Clip clipBehavior = Clip.none,
          Color color,
          double elevation = 0.0,
          Color shadowColor,
          ShapeBorder shape,
          TextStyle textStyle}) =>
      Material(
        key: key,
        type: type,
        animationDuration: animationDuration,
        borderOnForeground: borderOnForeground,
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        color: color,
        elevation: elevation,
        shadowColor: shadowColor,
        shape: shape,
        textStyle: textStyle,
        child: this,
      );
}

extension StringWidgetsExtension on String {
  Widget circularAssetImage(
          {Key key,
          double radius = 35.0,
          Color bgColor = Colors.white,
          Color fgColor,
          Widget child}) =>
      CircleAvatar(
        key: key,
        radius: radius,
        backgroundColor: bgColor,
        child: child,
        foregroundColor: fgColor,
        backgroundImage: AssetImage(this),
      );

  Widget circlularNetworkImage(
          {Key key,
          double radius = 65.0,
          Color bgColor = Colors.white,
          Color fgColor,
          Widget child}) =>
      CircleAvatar(
        key: key,
        radius: radius,
        backgroundColor: bgColor,
        child: child,
        foregroundColor: fgColor,
        backgroundImage: NetworkImage(
          this,
        ),
      );

  Widget circularAssetShadowImage({
    Key key,
    EdgeInsets margin = const EdgeInsets.all(0.0),
    EdgeInsets padding = const EdgeInsets.all(0.0),
    double width = 40.0,
    double height = 40.0,
    double blurRadius = 3.0,
    double borderRadius = 50.0,
  }) =>
      Container(
        key: key,
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          image: DecorationImage(image: AssetImage(this)),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: blurRadius,
              offset: const Offset(
                0.0,
                0.0,
              ),
            )
          ],
        ),
      );
}

class _KeepAliveWidget extends StatefulWidget {
  final Widget child;

  const _KeepAliveWidget(this.child);

  @override
  State<StatefulWidget> createState() => _KeepAliveState();
}

class _KeepAliveState extends State<_KeepAliveWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}

typedef AnimationUpdateCallBack<T> = Function(
    T animationVal, double controllerVal);

/// To perform forward animation in a simpler way
AnimationController withAnimation<T>(
    {@required TickerProvider vsync,
    @required Tween<T> tween,
    @required AnimationUpdateCallBack<T> callBack,
    Duration duration = const Duration(seconds: 1),
    double initialValue = 0.0,
    Curve curve = Curves.linear,
    Animation customAnimation}) {
  final AnimationController controller = AnimationController(
    vsync: vsync,
    duration: duration,
    value: initialValue,
  );
  final curveAnimation = CurvedAnimation(parent: controller, curve: curve);
  final Animation animation = customAnimation ?? tween.animate(curveAnimation);
  animation.addListener(() {
    callBack?.call(animation.value, controller.value);
  });

  controller.forward().whenCompleteOrCancel(() {
    controller.dispose();
  });

  return controller;
}

/// To perform repeat animation in a simpler way
AnimationController withRepeatAnimation<T>(
    {@required TickerProvider vsync,
    @required Tween<T> tween,
    @required AnimationUpdateCallBack<T> callBack,
    Duration duration = const Duration(seconds: 1),
    double initialValue = 0.0,
    Curve curve = Curves.linear,
    double lowerBound,
    double upperBound,
    bool isRepeatReversed = false,
    Duration repeatPeriod,
    Animation customAnimation}) {
  final AnimationController controller = AnimationController(
      vsync: vsync, duration: duration, value: initialValue);
  final curveAnimation = CurvedAnimation(parent: controller, curve: curve);
  final Animation animation = customAnimation ?? tween.animate(curveAnimation);
  animation.addListener(() {
    callBack?.call(animation.value, controller.value);
  });

  controller
      .repeat(
          min: lowerBound,
          max: upperBound,
          period: repeatPeriod,
          reverse: isRepeatReversed)
      .whenCompleteOrCancel(() {
    controller.dispose();
  });

  return controller;
}

class VxHalfClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return oldClipper != this;
  }
}
