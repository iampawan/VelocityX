// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/shadow_mixin.dart';

// ignore: must_be_immutable
class VxCircle extends StatelessWidget with VxShadowMixin<VxCircle> {
  /// Creates a circle that represents a shape.
  VxCircle({
    super.key,
    this.child,
    this.backgroundColor,
    this.radius,
    this.border,
    this.customDecoration,
    this.gradient,
    this.backgroundImage,
    this.blendMode,
    this.shadows,
  }) {
    setChildForShadow(this);
  }

  /// The widget below this widget in the tree.

  final Widget? child;

  /// The color with which to fill the circle. Changing the background
  /// color will cause the avatar to animate to the new color.
  ///
  /// If a [backgroundColor] is not specified, the theme's
  /// [ThemeData.primaryColorLight] is used with dark foreground colors, and
  /// [ThemeData.primaryColorDark] with light foreground colors.
  final Color? backgroundColor;

  /// The size of the circle, expressed as the radius (half the diameter).
  ///

  /// Changes to the [radius] are animated (including changing from an explicit
  /// [radius] to a [minRadius]/[maxRadius] pair or vice versa).
  final double? radius;

  /// Border to provide stroke.
  final BoxBorder? border;

  /// To fully provide custom decoration
  final BoxDecoration? customDecoration;

  /// To provide gradient
  final Gradient? gradient;

  /// To provide background image
  final DecorationImage? backgroundImage;

  /// To provide blend mode
  final BlendMode? blendMode;

  /// To give shadow effect
  final List<BoxShadow>? shadows;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    Color? effectiveBackgroundColor = backgroundColor;
    if (effectiveBackgroundColor == null) {
      switch (theme.brightness) {
        case Brightness.dark:
          effectiveBackgroundColor = theme.primaryColorLight;
          break;
        case Brightness.light:
          effectiveBackgroundColor = theme.primaryColorDark;
          break;
      }
    }

    return AnimatedContainer(
      height: radius ?? MediaQuery.sizeOf(context).shortestSide / 2,
      width: radius ?? MediaQuery.sizeOf(context).shortestSide / 2,
      duration: kThemeChangeDuration,
      decoration: customDecoration ??
          BoxDecoration(
            border: border,
            color: effectiveBackgroundColor,
            shape: BoxShape.circle,
            boxShadow: velocityShadow ?? shadows ?? kElevationToShadow[0],
            gradient: gradient,
            image: backgroundImage,
            backgroundBlendMode: blendMode,
          ),
      child: child,
    );
  }
}

// ignore: must_be_immutable
class VxCapsule extends StatelessWidget with VxShadowMixin<VxCapsule> {
  /// Creates a capsule that represents a shape.
  VxCapsule({
    super.key,
    this.child,
    this.backgroundColor,
    this.width,
    this.height,
    this.border,
    this.customDecoration,
    this.gradient,
    this.backgroundImage,
    this.blendMode,
    this.shadows,
  }) {
    setChildForShadow(this);
  }

  /// The widget below this widget in the tree.
  final Widget? child;

  /// The color with which to fill the circle.
  ///
  /// If a [backgroundColor] is not specified, the theme's
  /// [ThemeData.primaryColorLight] is used with dark foreground colors, and
  /// [ThemeData.primaryColorDark] with light foreground colors.
  final Color? backgroundColor;

  /// The width of the capsule.
  final double? width;

  /// The height of the capsule.
  final double? height;

  /// Border to provide stroke.
  final BoxBorder? border;

  /// To fully provide custom decoration
  final BoxDecoration? customDecoration;

  /// To provide gradient
  final Gradient? gradient;

  /// To provide background image
  final DecorationImage? backgroundImage;

  /// To provide blend mode
  final BlendMode? blendMode;

  /// To provide blend mode
  final List<BoxShadow>? shadows;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    Color? effectiveBackgroundColor = backgroundColor;
    if (effectiveBackgroundColor == null) {
      switch (theme.brightness) {
        case Brightness.dark:
          effectiveBackgroundColor = theme.primaryColorLight;
          break;
        case Brightness.light:
          effectiveBackgroundColor = theme.primaryColorDark;
          break;
      }
    }

    return AnimatedContainer(
      height: height ?? MediaQuery.sizeOf(context).shortestSide / 4,
      width: width ?? MediaQuery.sizeOf(context).shortestSide,
      duration: kThemeChangeDuration,
      decoration: customDecoration ??
          BoxDecoration(
              border: border,
              borderRadius: BorderRadius.circular(
                  MediaQuery.sizeOf(context).shortestSide / 2),
              color: effectiveBackgroundColor,
              shape: BoxShape.rectangle,
              gradient: gradient,
              image: backgroundImage,
              backgroundBlendMode: blendMode,
              boxShadow: velocityShadow ?? shadows ?? kElevationToShadow[0]),
      child: child,
    );
  }
}

// ignore: must_be_immutable
class VxEllipse extends StatelessWidget with VxShadowMixin<VxEllipse> {
  /// Creates a ellipse that represents a shape.
  VxEllipse({
    super.key,
    this.child,
    this.backgroundColor,
    this.width,
    this.height,
    this.border,
    this.customDecoration,
    this.gradient,
    this.backgroundImage,
    this.blendMode,
    this.shadows,
  }) {
    setChildForShadow(this);
  }

  /// The widget below this widget in the tree.
  final Widget? child;

  /// The color with which to fill the ellipse.
  ///
  /// If a [backgroundColor] is not specified, the theme's
  /// [ThemeData.primaryColorLight] is used with dark foreground colors, and
  /// [ThemeData.primaryColorDark] with light foreground colors.
  final Color? backgroundColor;

  /// The width of the ellipse.
  final double? width;

  /// The height of the ellipse.
  final double? height;

  /// Border to provide stroke.
  final BoxBorder? border;

  /// To fully provide custom decoration
  final BoxDecoration? customDecoration;

  /// To provide gradient
  final Gradient? gradient;

  /// To provide background image
  final DecorationImage? backgroundImage;

  /// To provide blend mode
  final BlendMode? blendMode;

  /// To provide blend mode
  final List<BoxShadow>? shadows;

  @override
  Widget build(BuildContext context) {
    final width0 = width ?? MediaQuery.sizeOf(context).shortestSide;
    final height0 = height ?? MediaQuery.sizeOf(context).shortestSide / 4;
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    Color? effectiveBackgroundColor = backgroundColor;
    if (effectiveBackgroundColor == null) {
      switch (theme.brightness) {
        case Brightness.dark:
          effectiveBackgroundColor = theme.primaryColorLight;
          break;
        case Brightness.light:
          effectiveBackgroundColor = theme.primaryColorDark;
          break;
      }
    }

    return AnimatedContainer(
      height: height0,
      width: width0,
      duration: kThemeChangeDuration,
      decoration: customDecoration ??
          BoxDecoration(
            border: border,
            borderRadius: BorderRadius.all(Radius.elliptical(width0, height0)),
            color: effectiveBackgroundColor,
            shape: BoxShape.rectangle,
            boxShadow: velocityShadow ?? shadows ?? kElevationToShadow[0],
            gradient: gradient,
            image: backgroundImage,
            backgroundBlendMode: blendMode,
          ),
      child: child,
    );
  }
}

// ignore: must_be_immutable
class VxBevel extends StatelessWidget with VxShadowMixin<VxBevel> {
  /// Creates a bevel that represents a shape.
  VxBevel({
    super.key,
    this.child,
    this.backgroundColor,
    this.radius,
    this.width,
    this.height,
    this.borderSide,
    this.gradient,
    this.backgroundImage,
    this.shadows,
  }) {
    setChildForShadow(this);
  }

  /// The widget below this widget in the tree.
  final Widget? child;

  /// The color with which to fill the bevel.
  ///
  /// If a [backgroundColor] is not specified, the theme's
  /// [ThemeData.primaryColorLight] is used with dark foreground colors, and
  /// [ThemeData.primaryColorDark] with light foreground colors.
  final Color? backgroundColor;

  /// The radius of the bevel.
  final double? radius;

  /// The width of the bevel.
  final double? width;

  /// The height of the bevel.
  final double? height;

  /// Border to provide stroke.
  final BorderSide? borderSide;

  /// To provide gradient
  final Gradient? gradient;

  /// To provide background image
  final DecorationImage? backgroundImage;

  /// To provide blend mode
  final List<BoxShadow>? shadows;

  @override
  Widget build(BuildContext context) {
    final width0 = width ?? MediaQuery.sizeOf(context).shortestSide;
    final height0 = height ?? MediaQuery.sizeOf(context).shortestSide / 4;
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    Color? effectiveBackgroundColor = backgroundColor;
    if (effectiveBackgroundColor == null) {
      switch (theme.brightness) {
        case Brightness.dark:
          effectiveBackgroundColor = theme.primaryColorLight;
          break;
        case Brightness.light:
          effectiveBackgroundColor = theme.primaryColorDark;
          break;
      }
    }

    return AnimatedContainer(
      height: height0,
      width: width0,
      duration: kThemeChangeDuration,
      decoration: ShapeDecoration(
        shape: BeveledRectangleBorder(
          side: borderSide ??
              const BorderSide(width: 0.0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            radius ?? 10.0,
          ),
        ),
        shadows: velocityShadow ?? shadows ?? kElevationToShadow[0],
        color: effectiveBackgroundColor,
        gradient: gradient,
        image: backgroundImage,
      ),
      child: child,
    );
  }
}

// ignore: must_be_immutable
class VxContinuousRectangle extends StatelessWidget
    with VxShadowMixin<VxContinuousRectangle> {
  /// Creates a continuous rectangle that represents a shape.
  VxContinuousRectangle({
    super.key,
    this.child,
    this.backgroundColor,
    this.radius,
    this.width,
    this.height,
    this.borderSide,
    this.gradient,
    this.backgroundImage,
    this.shadows,
  }) : assert(!(backgroundColor != null && gradient != null)) {
    setChildForShadow(this);
  }

  /// The widget below this widget in the tree.
  final Widget? child;

  /// The color with which to fill the rectangle.
  /// If a [backgroundColor] is not specified, the theme's
  /// [ThemeData.primaryColorLight] is used with dark foreground colors, and
  /// [ThemeData.primaryColorDark] with light foreground colors.
  final Color? backgroundColor;

  /// The radius of the rectangle.
  final double? radius;

  /// The width of the rectangle.
  final double? width;

  /// The height of the rectangle.
  final double? height;

  /// Border to provide stroke.
  final BorderSide? borderSide;

  /// To provide gradient
  final Gradient? gradient;

  /// To provide background image
  final DecorationImage? backgroundImage;

  /// To provide blend mode
  final List<BoxShadow>? shadows;

  @override
  Widget build(BuildContext context) {
    final width0 = width ?? MediaQuery.sizeOf(context).shortestSide;
    final height0 = height ?? MediaQuery.sizeOf(context).shortestSide / 4;
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    Color? effectiveBackgroundColor = backgroundColor;
    if (effectiveBackgroundColor == null && gradient == null) {
      switch (theme.brightness) {
        case Brightness.dark:
          effectiveBackgroundColor = theme.primaryColorLight;
          break;
        case Brightness.light:
          effectiveBackgroundColor = theme.primaryColorDark;
          break;
      }
    }

    return AnimatedContainer(
      height: height0,
      width: width0,
      duration: kThemeChangeDuration,
      decoration: ShapeDecoration(
        shape: ContinuousRectangleBorder(
          side: borderSide ??
              const BorderSide(width: 0.0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(radius ?? 10.0),
        ),
        shadows: velocityShadow ?? shadows ?? kElevationToShadow[0],
        color: effectiveBackgroundColor,
        image: backgroundImage,
        gradient: gradient,
      ),
      child: child,
    );
  }
}

class VxTriangle extends StatelessWidget {
  /// Creates a triangle that represents a shape.
  const VxTriangle({
    super.key,
    this.child,
    this.backgroundColor,
    this.width,
    this.height,
    this.strokeWidth,
  });

  /// The widget below this widget in the tree.
  final Widget? child;

  /// The color with which to fill the triangle.
  ///
  /// If a [backgroundColor] is not specified, the theme's
  /// [ThemeData.primaryColorLight] is used with dark foreground colors, and
  /// [ThemeData.primaryColorDark] with light foreground colors.
  final Color? backgroundColor;

  /// The width of the triangle.
  final double? width;

  /// The height of the triangle.
  final double? height;

  /// Width to provide stroke.
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    final width0 = width ?? MediaQuery.sizeOf(context).shortestSide / 2;
    final height0 = height ?? MediaQuery.sizeOf(context).shortestSide / 2;
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    Color? effectiveBackgroundColor = backgroundColor;
    if (effectiveBackgroundColor == null) {
      switch (theme.brightness) {
        case Brightness.dark:
          effectiveBackgroundColor = theme.primaryColorLight;
          break;
        case Brightness.light:
          effectiveBackgroundColor = theme.primaryColorDark;
          break;
      }
    }

    return AnimatedContainer(
      height: height0,
      width: width0,
      duration: kThemeChangeDuration,
      child: CustomPaint(
        size: Size(width0, height0),
        painter: _VxTriangle(effectiveBackgroundColor,
            strokeWidth: strokeWidth, isStroke: strokeWidth != null),
        child: child,
      ),
    );
  }
}

class VxTicket extends StatelessWidget {
  /// Creates a VxTicket that represents a shape.
  const VxTicket({
    super.key,
    this.child,
    this.backgroundColor,
    this.width,
    this.height,
    this.isHardEdged = false,
    this.isTwoSided = false,
  });

  /// The widget below this widget in the tree.
  final Widget? child;

  /// The color with which to fill the rectangle.
  /// If a [backgroundColor] is not specified, the theme's
  /// [ThemeData.primaryColorLight] is used with dark foreground colors, and
  /// [ThemeData.primaryColorDark] with light foreground colors.
  final Color? backgroundColor;

  /// The width of the rectangle.
  final double? width;

  /// The height of the rectangle.
  final double? height;

  /// The ticket type is by default curvish. If isHardEdged is true then it will be pointed edged.
  final bool? isHardEdged;

  /// Ticket style both sides
  final bool? isTwoSided;

  @override
  Widget build(BuildContext context) {
    final width0 = width ?? MediaQuery.sizeOf(context).shortestSide;
    final height0 = height ?? MediaQuery.sizeOf(context).shortestSide / 4;
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    Color? effectiveBackgroundColor = backgroundColor;
    if (effectiveBackgroundColor == null) {
      switch (theme.brightness) {
        case Brightness.dark:
          effectiveBackgroundColor = theme.primaryColorLight;
          break;
        case Brightness.light:
          effectiveBackgroundColor = theme.primaryColorDark;
          break;
      }
    }

    return ClipPath(
      clipper:
          _VxTicketClipper(isTwoSide: isTwoSided!, isHardEdge: isHardEdged!),
      child: AnimatedContainer(
        height: height0,
        width: width0,
        duration: kThemeChangeDuration,
        color: effectiveBackgroundColor,
        child: child,
      ),
    );
  }
}

class _VxTriangle extends CustomPainter {
  final Color? color;
  final double? strokeWidth;

  final bool isStroke;

  _VxTriangle(
    this.color, {
    this.strokeWidth = 0.0,
    this.isStroke = false,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    final paint = Paint()
      ..style = isStroke ? PaintingStyle.stroke : PaintingStyle.fill
      ..color = color!;
    if (strokeWidth != null) {
      paint.strokeWidth = strokeWidth!;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _VxTriangle oldDelegate) {
    return oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
  }
}

class _VxTicketClipper extends CustomClipper<Path> {
  final bool isTwoSide;
  final bool isHardEdge;

  _VxTicketClipper({this.isTwoSide = false, this.isHardEdge = false});
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);
    double x = 0;
    double y = size.height;
    final double yControlPoint = size.height * .85;
    final double increment = size.width / (isHardEdge ? 20 : 12);
    while (x < size.width) {
      if (isHardEdge) {
        x += increment;
        y = (y == size.height) ? size.height * .88 : size.height;
        path.lineTo(x, y);
      } else {
        path.quadraticBezierTo(
            x + increment / 2, yControlPoint, x + increment, y);
        x += increment;
      }
    }
    path.lineTo(size.width, 0.0);
    if (isTwoSide && !isHardEdge) {
      while (x > 0) {
        if (isHardEdge) {
          // x -= increment;
          // y = (y == 0) ? size.height * .15 : 0;
          // path.lineTo(x, y);
        } else {
          path.quadraticBezierTo(
              x - increment / 2, size.height * .15, x - increment, 0);
          x -= increment;
        }
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldDelegate) {
    return oldDelegate != this;
  }
}

extension VxShapesExtension on Widget {
  ///
  /// Extension method to directly access [VxCircle] with any widget without wrapping or with dot operator.
  ///
  VxCircle circle({
    Key? key,
    Widget? child,
    Color? backgroundColor,
    double? radius,
    BoxBorder? border,
    BoxDecoration? customDecoration,
    DecorationImage? backgroundImage,
    BlendMode? blendMode,
    Gradient? gradient,
    List<BoxShadow>? shadows,
  }) =>
      VxCircle(
        key: key,
        backgroundColor: backgroundColor,
        border: border,
        customDecoration: customDecoration,
        radius: radius,
        backgroundImage: backgroundImage,
        blendMode: blendMode,
        gradient: gradient,
        shadows: shadows,
        child: this,
      );

  ///
  /// Extension method to directly access [VxCapsule] with any widget without wrapping or with dot operator.
  ///
  VxCapsule capsule({
    Key? key,
    Widget? child,
    Color? backgroundColor,
    double? width,
    double? height,
    BoxBorder? border,
    BoxDecoration? customDecoration,
    DecorationImage? backgroundImage,
    BlendMode? blendMode,
    Gradient? gradient,
    List<BoxShadow>? shadows,
  }) =>
      VxCapsule(
        key: key,
        backgroundColor: backgroundColor,
        border: border,
        customDecoration: customDecoration,
        width: width,
        height: height,
        backgroundImage: backgroundImage,
        blendMode: blendMode,
        gradient: gradient,
        shadows: shadows,
        child: this,
      );

  ///
  /// Extension method to directly access [VxEllipse] with any widget without wrapping or with dot operator.
  ///
  VxEllipse ellipse({
    Key? key,
    Widget? child,
    Color? backgroundColor,
    double? width,
    double? height,
    BoxBorder? border,
    BoxDecoration? customDecoration,
    DecorationImage? backgroundImage,
    BlendMode? blendMode,
    Gradient? gradient,
    List<BoxShadow>? shadows,
  }) =>
      VxEllipse(
        key: key,
        backgroundColor: backgroundColor,
        border: border,
        customDecoration: customDecoration,
        width: width,
        height: height,
        backgroundImage: backgroundImage,
        blendMode: blendMode,
        gradient: gradient,
        shadows: shadows,
        child: this,
      );

  ///
  /// Extension method to directly access [VxBevel] with any widget without wrapping or with dot operator.
  ///
  VxBevel bevel({
    Key? key,
    Widget? child,
    Color? backgroundColor,
    double? radius,
    double? width,
    double? height,
    BorderSide? borderSide,
    DecorationImage? backgroundImage,
    Gradient? gradient,
    List<BoxShadow>? shadows,
  }) =>
      VxBevel(
        key: key,
        backgroundColor: backgroundColor,
        borderSide: borderSide,
        radius: radius,
        width: width,
        height: height,
        backgroundImage: backgroundImage,
        gradient: gradient,
        shadows: shadows,
        child: this,
      );

  ///
  /// Extension method to directly access [VxContinuousRectangle] with any widget without wrapping or with dot operator.
  ///
  VxContinuousRectangle continuousRectangle({
    Key? key,
    Widget? child,
    Color? backgroundColor,
    double? radius,
    double? width,
    double? height,
    BorderSide? borderSide,
    DecorationImage? backgroundImage,
    Gradient? gradient,
    List<BoxShadow>? shadows,
  }) =>
      VxContinuousRectangle(
        key: key,
        backgroundColor: backgroundColor,
        borderSide: borderSide,
        radius: radius,
        width: width,
        height: height,
        backgroundImage: backgroundImage,
        gradient: gradient,
        shadows: shadows,
        child: this,
      );

  ///
  /// Extension method to directly access [VxTriangle] with any widget without wrapping or with dot operator.
  ///
  VxTriangle triangle({
    Key? key,
    Widget? child,
    Color? backgroundColor,
    double? width,
    double? height,
    double? strokeWidth,
  }) =>
      VxTriangle(
        key: key,
        backgroundColor: backgroundColor,
        width: width,
        height: height,
        strokeWidth: strokeWidth,
        child: this,
      );

  ///
  /// Extension method to directly access [VxTicket] with any widget without wrapping or with dot operator.
  ///
  VxTicket ticket({
    Key? key,
    Widget? child,
    Color? backgroundColor,
    double? width,
    double? height,
    bool? isHardEdged,
    bool? isTwoSided,
  }) =>
      VxTicket(
        key: key,
        backgroundColor: backgroundColor,
        width: width,
        height: height,
        isHardEdged: isHardEdged,
        isTwoSided: isTwoSided,
        child: this,
      );
}
