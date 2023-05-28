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

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../velocity_x.dart';

extension VxWidgetsExtension on Widget {
  /// Uses [when] clause to render the widget only when the condition is true.
  Widget when(bool condition) => condition ? this : const VxNone();

  ///Tooltip as accessibility
  Widget tooltip(String message,
          {Key? key,
          Decoration? decoration,
          double? height,
          bool? preferBelow,
          EdgeInsetsGeometry? padding,
          TextStyle? textStyle,
          Duration? waitDuration,
          EdgeInsetsGeometry? margin}) =>
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
  Widget hide({Key? key, bool isVisible = false, bool maintainSize = false}) =>
      Visibility(
        key: key,
        visible: isVisible,
        maintainSize: maintainSize,
        maintainAnimation: maintainSize,
        maintainState: maintainSize,
        child: this,
      );

  ///Popup Menu Extensions
  Widget popupMenu(
    MenuBuilderCallback menuBuilder, {
    Key? key,
    VxPopupMenuController? controller,
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
        clickType: clickType,
        controller: controller,
        arrowColor: arrowColor,
        arrowSize: arrowSize,
        barrierColor: barrierColor,
        horizontalMargin: horizontalMargin,
        showArrow: showArrow,
        verticalMargin: verticalMargin,
        menuBuilder: menuBuilder,
        child: this,
      );

  /// Widget to show exception
  Widget errorWidget(Object ex) => ErrorWidget(ex);

  /// Extension for [Expanded]
  Expanded expand({Key? key, int flex = 1}) {
    return Expanded(
      key: key,
      flex: flex,
      child: this,
    );
  }

  /// Extension for [Flexible]
  Flexible flexible({Key? key, int flex = 1}) {
    return Flexible(
      key: key,
      flex: flex,
      child: this,
    );
  }

  /// Extension for Stack [Positioned]
  Widget positioned(
      {double? top,
      double? bottom,
      double? left,
      double? right,
      double? height,
      double? width,
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
  DecoratedBox backgroundColor(Color? color) {
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

  /// Extension for creating a oval shape using [ClipOval]
  Widget clipOval(
      {Clip clipBehavior = Clip.antiAlias, CustomClipper<Rect>? clipper}) {
    return ClipOval(
      key: key,
      clipBehavior: clipBehavior,
      clipper: clipper,
      child: this,
    );
  }

  Widget disabled(bool disable) {
    return IgnorePointer(
      ignoring: disable,
      child: opacity(value: disable ? 0.3 : 1.0),
    );
  }

  /// Extension for keepAlive
  Widget keepAlive() {
    return _KeepAliveWidget(this);
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
    return PreferredSize(preferredSize: size, child: this);
  }

  /// Extension method for [Material] Widget
  Widget material(
          {Key? key,
          MaterialType type = MaterialType.canvas,
          Duration animationDuration = kThemeAnimationDuration,
          bool borderOnForeground = true,
          BorderRadiusGeometry? borderRadius,
          Clip clipBehavior = Clip.none,
          Color? color,
          double elevation = 0.0,
          Color? shadowColor,
          ShapeBorder? shape,
          TextStyle? textStyle}) =>
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

  /// Extension method for [SafeArea] Widget
  Widget safeArea(
          {Key? key,
          EdgeInsets minimum = EdgeInsets.zero,
          bool maintainBottomViewPadding = false,
          bool top = true,
          bool bottom = true,
          bool left = true,
          bool right = true}) =>
      SafeArea(
        key: key,
        minimum: minimum,
        maintainBottomViewPadding: maintainBottomViewPadding,
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: this,
      );

  /// Extension method for [ShaderMask] Widget
  Widget shaderMask({
    required Gradient gradient,
    Key? key,
    BlendMode blendMode = BlendMode.modulate,
  }) =>
      ShaderMask(
        blendMode: blendMode,
        key: key,
        shaderCallback: (bounds) => gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
        child: this,
      );

  /// Extension method for [VxInnerShadow] Widget
  Widget innerShadow({
    Key? key,
    double blur = 2.0,
    Color color = Colors.black38,
    Offset offset = const Offset(2, 2),
  }) =>
      VxInnerShadow(
        key: key,
        blur: blur,
        color: color,
        offset: offset,
        child: this,
      );

  /// Extension method for [SliverToBoxAdapter] Widget
  Widget toSliverBox({Key? key}) => SliverToBoxAdapter(key: key, child: this);

  SliverToBoxAdapter sliverToBoxAdapter({Key? key}) =>
      SliverToBoxAdapter(key: key, child: this);

  BackdropFilter backdropFilter(
          {Key? key, ImageFilter? filter, double fuzzyDegree = 4}) =>
      BackdropFilter(
          key: key,
          filter: filter ??
              ImageFilter.blur(sigmaX: fuzzyDegree, sigmaY: fuzzyDegree),
          child: this);

  FittedBox fittedBox(
          {Key? key,
          BoxFit fit = BoxFit.contain,
          AlignmentGeometry alignment = Alignment.center,
          Clip clipBehavior = Clip.none}) =>
      FittedBox(
          key: key,
          fit: fit,
          alignment: alignment,
          clipBehavior: clipBehavior,
          child: this);

  /// Wrap widget with [ColoredBox]
  ColoredBox color(Color color, {Key? key}) =>
      ColoredBox(key: key, color: color, child: this);

  /// Wrap widget with [VxFilter]
  Widget foregroundColor(Color color, {Key? key}) =>
      VxFilter(child: this).blend(color, BlendMode.color).make();

  ConstrainedBox constrainedBox(BoxConstraints constraints, {Key? key}) =>
      ConstrainedBox(key: key, constraints: constraints, child: this);

  Hero hero(
    Object tag, {
    Key? key,
    CreateRectTween? createRectTween,
    HeroFlightShuttleBuilder? flightShuttleBuilder,
    HeroPlaceholderBuilder? placeholderBuilder,
    bool transitionOnUserGestures = false,
  }) =>
      Hero(
          key: key,
          createRectTween: createRectTween,
          flightShuttleBuilder: flightShuttleBuilder,
          placeholderBuilder: placeholderBuilder,
          transitionOnUserGestures: transitionOnUserGestures,
          tag: tag,
          child: this);

  List<Widget> asList() => <Widget>[this];
}

extension StringWidgetsExtension on String {
  Widget circularAssetImage(
          {Key? key,
          double radius = 35.0,
          Color bgColor = Colors.white,
          Color? fgColor,
          Widget? child}) =>
      CircleAvatar(
        key: key,
        radius: radius,
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        backgroundImage: AssetImage(this),
        child: child,
      );

  Widget circularNetworkImage(
          {Key? key,
          double radius = 65.0,
          Color bgColor = Colors.white,
          Color? fgColor,
          Widget? child}) =>
      CircleAvatar(
        key: key,
        radius: radius,
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        backgroundImage: NetworkImage(
          this,
        ),
        child: child,
      );

  Widget circularAssetShadowImage({
    Key? key,
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
    {required TickerProvider vsync,
    required Tween<T> tween,
    required AnimationUpdateCallBack<T?> callBack,
    Duration duration = const Duration(seconds: 1),
    double initialValue = 0.0,
    Curve curve = Curves.linear,
    Animation? customAnimation}) {
  final AnimationController controller = AnimationController(
    vsync: vsync,
    duration: duration,
    value: initialValue,
  );
  final curveAnimation = CurvedAnimation(parent: controller, curve: curve);
  final Animation animation = customAnimation ?? tween.animate(curveAnimation);
  animation.addListener(() {
    callBack.call(animation.value, controller.value);
  });

  controller.forward().whenCompleteOrCancel(() {
    controller.dispose();
  });

  return controller;
}

/// To perform repeat animation in a simpler way
AnimationController withRepeatAnimation<T>(
    {required TickerProvider vsync,
    required Tween<T> tween,
    required AnimationUpdateCallBack<T?> callBack,
    Duration duration = const Duration(seconds: 1),
    double initialValue = 0.0,
    Curve curve = Curves.linear,
    double? lowerBound,
    double? upperBound,
    bool isRepeatReversed = false,
    Duration? repeatPeriod,
    Animation? customAnimation}) {
  final AnimationController controller = AnimationController(
      vsync: vsync, duration: duration, value: initialValue);
  final curveAnimation = CurvedAnimation(parent: controller, curve: curve);
  final Animation animation = customAnimation ?? tween.animate(curveAnimation);
  animation.addListener(() {
    callBack.call(animation.value, controller.value);
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

class VxInnerShadow extends SingleChildRenderObjectWidget {
  const VxInnerShadow({
    super.key,
    this.blur = 10,
    this.color = Colors.black38,
    this.offset = const Offset(10, 10),
    super.child,
  });

  final double blur;
  final Color color;
  final Offset offset;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final RenderInnerShadow renderObject = RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderInnerShadow renderObject) {
    renderObject
      ..color = color
      ..blur = blur
      ..dx = offset.dx
      ..dy = offset.dy;
  }
}

class RenderInnerShadow extends RenderProxyBox {
  late double blur;
  late Color color;
  late double dx;
  late double dy;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) {
      return;
    }

    final Rect rectOuter = offset & size;
    final Rect rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width - dx,
      size.height - dy,
    );
    final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
    context.paintChild(child as RenderObject, offset);
    final Paint shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(sigmaX: blur, sigmaY: blur)
      ..colorFilter = ColorFilter.mode(color, BlendMode.srcOut);

    canvas
      ..saveLayer(rectOuter, shadowPaint)
      ..saveLayer(rectInner, Paint())
      ..translate(dx, dy);
    context.paintChild(child as RenderObject, offset);
    context.canvas
      ..restore()
      ..restore()
      ..restore();
  }
}
