// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// @dart = 2.8

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VxCircle extends StatelessWidget {
  /// Creates a circle that represents a user.
  const VxCircle({
    Key key,
    this.child,
    this.backgroundColor,
    this.radius,
    this.border,
    this.customDecoration,
  }) : super(key: key);

  /// The widget below this widget in the tree.

  final Widget child;

  /// The color with which to fill the circle. Changing the background
  /// color will cause the avatar to animate to the new color.
  ///
  /// If a [backgroundColor] is not specified, the theme's
  /// [ThemeData.primaryColorLight] is used with dark foreground colors, and
  /// [ThemeData.primaryColorDark] with light foreground colors.
  final Color backgroundColor;

  /// The size of the circle, expressed as the radius (half the diameter).
  ///

  /// Changes to the [radius] are animated (including changing from an explicit
  /// [radius] to a [minRadius]/[maxRadius] pair or vice versa).
  final double radius;

  /// Border to provide stroke.
  final BoxBorder border;

  /// To fully provide custom decoration
  final BoxDecoration customDecoration;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    Color effectiveBackgroundColor = backgroundColor;
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
      height: radius ?? MediaQuery.of(context).size.shortestSide / 2,
      width: radius ?? MediaQuery.of(context).size.shortestSide / 2,
      duration: kThemeChangeDuration,
      decoration: customDecoration ??
          BoxDecoration(
            border: border,
            color: effectiveBackgroundColor,
            shape: BoxShape.circle,
          ),
      child: child,
    );
  }
}

class VxCapsule extends StatelessWidget {
  /// Creates a capsule that represents a shape.
  const VxCapsule({
    Key key,
    this.child,
    this.backgroundColor,
    this.width,
    this.height,
    this.border,
    this.customDecoration,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  /// The color with which to fill the circle.
  ///
  /// If a [backgroundColor] is not specified, the theme's
  /// [ThemeData.primaryColorLight] is used with dark foreground colors, and
  /// [ThemeData.primaryColorDark] with light foreground colors.
  final Color backgroundColor;

  /// The width of the capsule.
  final double width;

  /// The height of the capsule.
  final double height;

  /// Border to provide stroke.
  final BoxBorder border;

  /// To fully provide custom decoration
  final BoxDecoration customDecoration;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    Color effectiveBackgroundColor = backgroundColor;
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
      height: height ?? MediaQuery.of(context).size.shortestSide / 4,
      width: width ?? MediaQuery.of(context).size.shortestSide,
      duration: kThemeChangeDuration,
      decoration: customDecoration ??
          BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.shortestSide / 2),
            color: effectiveBackgroundColor,
            shape: BoxShape.rectangle,
          ),
      child: child,
    );
  }
}

class VxEllipse extends StatelessWidget {
  /// Creates a ellipse that represents a shape.
  const VxEllipse({
    Key key,
    this.child,
    this.backgroundColor,
    this.width,
    this.height,
    this.border,
    this.customDecoration,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  /// The color with which to fill the ellipse.
  ///
  /// If a [backgroundColor] is not specified, the theme's
  /// [ThemeData.primaryColorLight] is used with dark foreground colors, and
  /// [ThemeData.primaryColorDark] with light foreground colors.
  final Color backgroundColor;

  /// The width of the ellipse.
  final double width;

  /// The height of the ellipse.
  final double height;

  /// Border to provide stroke.
  final BoxBorder border;

  /// To fully provide custom decoration
  final BoxDecoration customDecoration;

  @override
  Widget build(BuildContext context) {
    final _width = width ?? MediaQuery.of(context).size.shortestSide;
    final _height = height ?? MediaQuery.of(context).size.shortestSide / 4;
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    Color effectiveBackgroundColor = backgroundColor;
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
      height: _height,
      width: _width,
      duration: kThemeChangeDuration,
      decoration: customDecoration ??
          BoxDecoration(
            border: border,
            borderRadius: BorderRadius.all(Radius.elliptical(_width, _height)),
            color: effectiveBackgroundColor,
            shape: BoxShape.rectangle,
          ),
      child: child,
    );
  }
}

class VxBevel extends StatelessWidget {
  /// Creates a bevel that represents a shape.
  const VxBevel({
    Key key,
    this.child,
    this.backgroundColor,
    this.radius,
    this.width,
    this.height,
    this.borderSide,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  /// The color with which to fill the bevel.
  ///
  /// If a [backgroundColor] is not specified, the theme's
  /// [ThemeData.primaryColorLight] is used with dark foreground colors, and
  /// [ThemeData.primaryColorDark] with light foreground colors.
  final Color backgroundColor;

  /// The radius of the bevel.
  final double radius;

  /// The width of the bevel.
  final double width;

  /// The height of the bevel.
  final double height;

  /// Border to provide stroke.
  final BorderSide borderSide;

  @override
  Widget build(BuildContext context) {
    final _width = width ?? MediaQuery.of(context).size.shortestSide;
    final _height = height ?? MediaQuery.of(context).size.shortestSide / 4;
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    Color effectiveBackgroundColor = backgroundColor;
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
      height: _height,
      width: _width,
      duration: kThemeChangeDuration,
      child: Material(
        animationDuration: kThemeChangeDuration,
        color: effectiveBackgroundColor,
        child: child,
        shape: BeveledRectangleBorder(
          side: borderSide ??
              const BorderSide(width: 0.0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(radius ?? 10.0),
        ),
      ),
    );
  }
}

class VxContinousRectangle extends StatelessWidget {
  /// Creates a continous rectangle that represents a shape.
  const VxContinousRectangle({
    Key key,
    this.child,
    this.backgroundColor,
    this.radius,
    this.width,
    this.height,
    this.borderSide,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  /// The color with which to fill the rectangle.
  /// If a [backgroundColor] is not specified, the theme's
  /// [ThemeData.primaryColorLight] is used with dark foreground colors, and
  /// [ThemeData.primaryColorDark] with light foreground colors.
  final Color backgroundColor;

  /// The radius of the rectangle.
  final double radius;

  /// The width of the rectangle.
  final double width;

  /// The height of the rectangle.
  final double height;

  /// Border to provide stroke.
  final BorderSide borderSide;

  @override
  Widget build(BuildContext context) {
    final _width = width ?? MediaQuery.of(context).size.shortestSide;
    final _height = height ?? MediaQuery.of(context).size.shortestSide / 4;
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    Color effectiveBackgroundColor = backgroundColor;
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
      height: _height,
      width: _width,
      duration: kThemeChangeDuration,
      child: Material(
        animationDuration: kThemeChangeDuration,
        color: effectiveBackgroundColor,
        child: child,
        shape: ContinuousRectangleBorder(
          side: borderSide ??
              const BorderSide(width: 0.0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(radius ?? 10.0),
        ),
      ),
    );
  }
}

class VxTriangle extends StatelessWidget {
  /// Creates a triangle that represents a shape.
  const VxTriangle({
    Key key,
    this.child,
    this.backgroundColor,
    this.width,
    this.height,
    this.strokeWidth,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  /// The color with which to fill the triangle.
  ///
  /// If a [backgroundColor] is not specified, the theme's
  /// [ThemeData.primaryColorLight] is used with dark foreground colors, and
  /// [ThemeData.primaryColorDark] with light foreground colors.
  final Color backgroundColor;

  /// The width of the traingle.
  final double width;

  /// The height of the triangle.
  final double height;

  /// Width to provide stroke.
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final _width = width ?? MediaQuery.of(context).size.shortestSide / 2;
    final _height = height ?? MediaQuery.of(context).size.shortestSide / 2;
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    Color effectiveBackgroundColor = backgroundColor;
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
      height: _height,
      width: _width,
      duration: kThemeChangeDuration,
      child: CustomPaint(
        child: child,
        size: Size(_width, _height),
        painter: _VxTriangle(effectiveBackgroundColor,
            strokeWidth: strokeWidth, isStroke: strokeWidth != null),
      ),
    );
  }
}

class _VxTriangle extends CustomPainter {
  final Color color;
  final double strokeWidth;

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
      ..color = color;
    if (strokeWidth != null) {
      paint.strokeWidth = strokeWidth;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _VxTriangle oldDelegate) {
    return oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
  }
}

extension ShapesExtension on Widget {
  ///
  /// Extension method to directly access [VxCircle] with any widget without wrapping or with dot operator.
  ///
  Widget circle({
    Key key,
    Widget child,
    Color backgroundColor,
    double radius,
    BoxBorder border,
    BoxDecoration customDecoration,
  }) =>
      VxCircle(
        key: key,
        child: this,
        backgroundColor: backgroundColor,
        border: border,
        customDecoration: customDecoration,
        radius: radius,
      );

  ///
  /// Extension method to directly access [VxCapsule] with any widget without wrapping or with dot operator.
  ///
  Widget capsule({
    Key key,
    Widget child,
    Color backgroundColor,
    double width,
    double height,
    BoxBorder border,
    BoxDecoration customDecoration,
  }) =>
      VxCapsule(
        key: key,
        child: this,
        backgroundColor: backgroundColor,
        border: border,
        customDecoration: customDecoration,
        width: width,
        height: height,
      );

  ///
  /// Extension method to directly access [VxEllipse] with any widget without wrapping or with dot operator.
  ///
  Widget ellipse({
    Key key,
    Widget child,
    Color backgroundColor,
    double width,
    double height,
    BoxBorder border,
    BoxDecoration customDecoration,
  }) =>
      VxEllipse(
        key: key,
        child: this,
        backgroundColor: backgroundColor,
        border: border,
        customDecoration: customDecoration,
        width: width,
        height: height,
      );

  ///
  /// Extension method to directly access [VxBevel] with any widget without wrapping or with dot operator.
  ///
  Widget bevel({
    Key key,
    Widget child,
    Color backgroundColor,
    double radius,
    double width,
    double height,
    BorderSide borderSide,
  }) =>
      VxBevel(
        key: key,
        child: this,
        backgroundColor: backgroundColor,
        borderSide: borderSide,
        radius: radius,
        width: width,
        height: height,
      );

  ///
  /// Extension method to directly access [VxContinousRectangle] with any widget without wrapping or with dot operator.
  ///
  Widget continousRectangle({
    Key key,
    Widget child,
    Color backgroundColor,
    double radius,
    double width,
    double height,
    BorderSide borderSide,
  }) =>
      VxContinousRectangle(
        key: key,
        child: this,
        backgroundColor: backgroundColor,
        borderSide: borderSide,
        radius: radius,
        width: width,
        height: height,
      );

  ///
  /// Extension method to directly access [VxTriangle] with any widget without wrapping or with dot operator.
  ///
  Widget triangle({
    Key key,
    Widget child,
    Color backgroundColor,
    double width,
    double height,
    double strokeWidth,
  }) =>
      VxTriangle(
        key: key,
        child: this,
        backgroundColor: backgroundColor,
        width: width,
        height: height,
        strokeWidth: strokeWidth,
      );
}
