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
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/num_ext.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/alignment_mixin.dart';
import 'package:velocity_x/src/flutter/velocityx_mixins/neu_mixin.dart';
import 'package:velocity_x/velocity_x.dart';

import 'builder.dart';
import 'common/velocity_curve.dart';
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
        VxAlignmentMixing<VxBox>,
        VxColorMixin<VxBox>,
        VxPaddingMixin<VxBox>,
        VxRoundMixin<VxBox>,
        VxNeuMixin {
  VxBox({this.child}) {
    setChildForAlignment(this);
    setChildToColor(this);
    setChildToPad(this);
    setChildToRound(this);
  }

  final Widget child;

  bool _isCircleRounded = false;
  List<BoxShadow> _boxShadow;
  BoxBorder _border;
  Gradient _gradient;
  double _height;
  double _width;
  VxNeumorph _velocityNeumorph;
  Clip _clip;

  EdgeInsetsGeometry _margin;
  Matrix4 _transform;

  DecorationImage _bgImage;

  BoxDecoration _decoration, _foregroundDecoration;
  BoxConstraints _constraints;

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

  /// Shadowing
  VxBox get shadow {
    _boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        blurRadius: 3.0,
        spreadRadius: 1.0,
        offset: Offset(0.0, 1.0),
      ),
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.06),
        blurRadius: 2.0,
        spreadRadius: 1.0,
        offset: Offset(0.0, 1.0),
      ),
    ];

    return this;
  }

  ///
  /// To give extra small shadow.
  ///
  VxBox get shadowXs {
    _boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.05),
        blurRadius: 0.0,
        spreadRadius: 1.0,
        offset: Offset(0.0, 0.0),
      ),
    ];

    return this;
  }

  ///
  /// To give small shadow.
  ///
  VxBox get shadowSm {
    _boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.05),
        blurRadius: 2.0,
        spreadRadius: 0.0,
        offset: Offset(0.0, 1.0),
      ),
    ];

    return this;
  }

  ///
  /// To give medium shadow.
  ///
  VxBox get shadowMd {
    _boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        blurRadius: 6.0,
        spreadRadius: -1.0,
        offset: Offset(0.0, 4.0),
      ),
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.06),
        blurRadius: 4.0,
        spreadRadius: -1.0,
        offset: Offset(0.0, 2.0),
      ),
    ];

    return this;
  }

  ///
  /// To give large shadow.
  ///
  VxBox get shadowLg {
    _boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        blurRadius: 15.0,
        spreadRadius: -3.0,
        offset: Offset(0.0, 10.0),
      ),
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.05),
        blurRadius: 6.0,
        spreadRadius: -2.0,
        offset: Offset(0.0, 4.0),
      ),
    ];

    return this;
  }

  ///
  /// To give extra large shadow.
  ///
  VxBox get shadowXl {
    _boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        blurRadius: 25.0,
        spreadRadius: -5.0,
        offset: Offset(0.0, 20.0),
      ),
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.04),
        blurRadius: 10.0,
        spreadRadius: -5.0,
        offset: Offset(0.0, 10.0),
      ),
    ];

    return this;
  }

  ///
  /// To give twice extra small shadow.
  ///
  VxBox get shadow2xl {
    _boxShadow = [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.25),
        blurRadius: 50.0,
        spreadRadius: -12.0,
        offset: Offset(0.0, 25.0),
      ),
    ];

    return this;
  }

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
  VxBox shadowOutline({Color outlineColor}) {
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
  VxBox linearGradient(List<Color> colors) =>
      this.._gradient = LinearGradient(colors: colors);

  ///
  /// Sets the radial gradient to the decorated box.
  ///
  VxBox radialGradient(List<Color> colors) =>
      this.._gradient = RadialGradient(colors: colors);

  ///
  /// Sets the sweep gradient to the decorated box.
  ///
  VxBox sweepGradient(List<Color> colors) =>
      this.._gradient = SweepGradient(colors: colors);

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
          {Color color,
          VxCurve curve = VxCurve.concave,
          double elevation = 12.0}) =>
      this
        .._velocityNeumorph = velocityDecoration(
          color ?? velocityColor ?? ThemeData().scaffoldBackgroundColor,
          curve,
          elevation,
        );

  @override
  Widget make({Key key}) {
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
              borderRadius: _isCircleRounded || roundedValue.isNull
                  ? null
                  : BorderRadius.circular(roundedValue),
              shape: _isCircleRounded ? BoxShape.circle : BoxShape.rectangle,
              boxShadow: _velocityNeumorph.shadows,
              border: _border,
              gradient: _velocityNeumorph.gradient,
              image: _bgImage,
            )
          : _decoration ??
              BoxDecoration(
                color: velocityColor,
                borderRadius: _isCircleRounded || roundedValue.isNull
                    ? null
                    : BorderRadius.circular(roundedValue),
                shape: _isCircleRounded ? BoxShape.circle : BoxShape.rectangle,
                boxShadow: _boxShadow ?? [],
                border: _border,
                gradient: _gradient,
                image: _bgImage,
              ),
    );
  }
}

extension ContainerWidgetExtension on Widget {
  ///
  /// Extension method to directly access material [VxBox] with any widget without wrapping or with dot operator.
  ///
  VxBox get box => VxBox(child: this);
}
