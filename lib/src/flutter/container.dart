/*
 * Copyright 2020 Pawan Kumar. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/alignment_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/gradient_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/neu_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/shadow_mixin.dart';
import 'package:velocity_x/velocity_x.dart';

import 'builder.dart';
import 'velocityx_mixins/color_mixin.dart';
import 'velocityx_mixins/padding_mixin.dart';
import 'velocityx_mixins/round_mixin.dart';

/// A convenience widget that combines common painting, positioning, and sizing
/// widgets.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=c1xLMaTUWCY}
///
/// A container/VxBox first surrounds the child with [padding] (inflated by any
/// borders present in the [decoration]) and then applies additional
/// [constraints] to the padded extent (incorporating the `width` and `height`
/// as constraints, if either is non-null). The container is then surrounded by
/// additional empty space described from the [margin].
///
/// During painting, the container first applies the given [transform], then
/// paints the [decoration] to fill the padded extent, then it paints the child,
/// and finally paints the [foregroundDecoration], also filling the padded
/// extent.
///
/// Containers with no children try to be as big as possible unless the incoming
/// constraints are unbounded, in which case they try to be as small as
/// possible. Containers with children size themselves to their children. The
/// `width`, `height`, and [constraints] arguments to the constructor override
/// this.
///
/// By default, boxes/containers return false for all hit tests. If the [color]
/// property is specified, the hit testing is handled by [ColoredBox], which
/// always returns true. If the [decoration] or [foregroundDecoration] properties
/// are specified, hit testing is handled by [Decoration.hitTest].
///

class VxBox extends VxWidgetBuilder<Widget>
    with
        VxAlignmentMixin<VxBox>,
        VxColorMixin<VxBox>,
        VxGradientMixin<VxBox>,
        VxPaddingMixin<VxBox>,
        VxRoundMixin<VxBox>,
        VxShadowMixin<VxBox>,
        VxNeuMixin {
  VxBox({this.child}) {
    setChildForAlignment(this);
    setChildToColor(this);
    setChildToGradient(this);
    setChildToPad(this);
    setChildToRound(this);
    setChildForShadow(this);
  }

  final Widget? child;

  bool _isCircleRounded = false;
  List<BoxShadow>? _boxShadow;
  BoxBorder? _border;
  Gradient? _gradient;
  double? _height;
  double? _width;
  VxNeumorph? _velocityNeumorph;
  Clip? _clip;

  EdgeInsetsGeometry? _margin;
  Matrix4? _transform;

  DecorationImage? _bgImage;

  BoxDecoration? _decoration, _foregroundDecoration;
  BoxConstraints? _constraints;

  ///
  /// Sets the height property of the box.
  ///
  VxBox height(double val) => this.._height = val;

  ///
  /// Sets the width property of the box.
  ///
  VxBox width(double val) => this.._width = val;

  ///
  /// Sets the size (width & height) property of the box.
  ///
  VxBox size(double width, double height) => this
    .._width = width
    .._height = height;

  ///
  /// Sets the size (width & height in percentage) property of the box.
  ///
  VxBox sizePCT(
          {required BuildContext context,
          required double widthPCT,
          required double heightPCT}) =>
      this
        .._width = context.percentWidth * widthPCT
        .._height = context.percentHeight * heightPCT;

  ///
  /// Sets the height and width as square of the box.
  ///
  VxBox square(double val) => this
    .._width = val
    .._height = val;

  ///
  /// Provide a custom DecoratedBox
  ///
  VxBox withDecoration(BoxDecoration decoration) =>
      this.._decoration = decoration;

  ///
  /// Provide a custom Foreground DecoratedBox
  ///
  VxBox withForegroundDecoration(BoxDecoration decoration) =>
      this.._foregroundDecoration = decoration;

  ///
  /// Provide a box constraint
  ///
  VxBox withConstraints(BoxConstraints constraints) =>
      this.._constraints = constraints;

  ///
  /// Sets the padding property of the box.
  ///
  VxBox padding(EdgeInsetsGeometry val) => this..velocityPadding = val;

  ///
  /// Sets the margin property of the box.
  ///
  VxBox margin(EdgeInsetsGeometry val) => this.._margin = val;

  ///
  /// Sets the color property of the box.
  ///
  VxBox color(Color color) => this..velocityColor = color;

  ///
  /// Sets the color property of the box using the hex color value.
  ///
  VxBox hexColor(String colorHex) =>
      this..velocityColor = Vx.hexToColor(colorHex);

  /// transforming
  ///
  /// Sets the transform property to the animated box.
  ///
  VxBox transform(Matrix4 val) => this.._transform = val;

  ///
  /// Sets the clip behavior of the box.
  ///
  VxBox clip(Clip clip) => this.._clip = clip;

  ///
  /// Sets the decorated box as circular.
  ///
  VxBox get roundedFull => this.._isCircleRounded = true;

  /// Provide custom list of box shadows
  ///
  /// To give custom shadow.
  ///
  VxBox withShadow(List<BoxShadow> shadows) {
    _boxShadow = shadows;
    return this;
  }

  ///
  /// To give shadow with some outline color.
  ///
  VxBox shadowOutline({Color? outlineColor}) {
    _boxShadow = [
      BoxShadow(
        color: outlineColor?.withOpacity(0.5) ??
            const Color.fromRGBO(66, 153, 225, 0.5),
        blurRadius: 0.0,
        spreadRadius: 3.0,
        offset: const Offset(0.0, 0.0),
      ),
    ];

    return this;
  }

  /// Bordering
  /// Sets the border of the Box.
  ///
  VxBox border(
      {Color color = Colors.black,
      double width = 1.0,
      BorderStyle style = BorderStyle.solid}) {
    _border = Border.all(color: color, width: width, style: style);
    return this;
  }

  /// Gradienting
  /// Sets the linear gradient to the decorated box.
  ///
  VxBox linearGradient(List<Color> colors,
          {AlignmentGeometry begin = Alignment.centerLeft,
          AlignmentGeometry end = Alignment.centerRight,
          List<double>? stops,
          TileMode tileMode = TileMode.clamp,
          GradientTransform? transform}) =>
      this
        .._gradient = LinearGradient(
            colors: colors,
            begin: begin,
            stops: stops,
            end: end,
            tileMode: tileMode,
            transform: transform);

  ///
  /// Sets the radial gradient to the decorated box.
  ///
  VxBox radialGradient(List<Color> colors,
          {AlignmentGeometry center = Alignment.center,
          double radius = 0.5,
          List<double>? stops,
          TileMode tileMode = TileMode.clamp,
          AlignmentGeometry? focal,
          double focalRadius = 0.0,
          GradientTransform? transform}) =>
      this
        .._gradient = RadialGradient(
            colors: colors,
            center: center,
            radius: radius,
            focalRadius: focalRadius,
            stops: stops,
            focal: focal,
            tileMode: tileMode,
            transform: transform);

  ///
  /// Sets the sweep gradient to the decorated box.
  ///
  VxBox sweepGradient(List<Color> colors,
          {AlignmentGeometry center = Alignment.center,
          double startAngle = 0.0,
          double endAngle = pi * 2,
          List<double>? stops,
          TileMode tileMode = TileMode.clamp,
          GradientTransform? transform}) =>
      this
        .._gradient = SweepGradient(
            colors: colors,
            center: center,
            endAngle: endAngle,
            startAngle: startAngle,
            stops: stops,
            tileMode: tileMode,
            transform: transform);

  ///
  /// Sets the defined gradient to the decorated box.
  ///
  VxBox withGradient(Gradient gradient) => this.._gradient = gradient;

// DecorationImage BoxDecoration
  ///
  /// Sets the background image to the decorated box.
  ///
  VxBox bgImage(DecorationImage image) => this.._bgImage = image;

  ///
  /// Use this to convert your box to the neumorphic design. Use it wisely.
  ///
  VxBox neumorphic(
          {Color? color,
          VxCurve curve = VxCurve.concave,
          double elevation = 12.0}) =>
      this
        .._velocityNeumorph = velocityDecoration(
          (color ?? velocityColor)!,
          curve,
          elevation,
        );

  @override
  Widget make({Key? key}) {
    return Container(
      key: key,
      height: _height,
      constraints: _constraints,
      clipBehavior: _clip ?? Clip.none,
      width: _width,
      padding: velocityPadding,
      margin: _margin,
      alignment: velocityAlignment,
      transform: _transform,
      child: child,
      foregroundDecoration: _foregroundDecoration,
      decoration: _velocityNeumorph != null
          ? BoxDecoration(
              borderRadius: _isCircleRounded || (roundedValue == null)
                  ? null
                  : (radiusGeometry ?? BorderRadius.circular(roundedValue!)),
              shape: _isCircleRounded ? BoxShape.circle : BoxShape.rectangle,
              boxShadow: _velocityNeumorph!.shadows,
              border: _border,
              gradient: velocityGradient ?? _velocityNeumorph!.gradient,
              image: _bgImage,
            )
          : _decoration ??
              BoxDecoration(
                color: velocityColor,
                borderRadius: _isCircleRounded || (roundedValue == null)
                    ? null
                    : (radiusGeometry ?? BorderRadius.circular(roundedValue!)),
                shape: _isCircleRounded ? BoxShape.circle : BoxShape.rectangle,
                boxShadow: velocityShadow ?? _boxShadow ?? [],
                border: _border,
                gradient: velocityGradient ?? _gradient,
                image: _bgImage,
              ),
    );
  }
}

extension VxContainerWidgetExtension on Widget {
  ///
  /// Extension method to directly access material [VxBox] with any widget without wrapping or with dot operator.
  ///
  VxBox get box => VxBox(child: this);
}
